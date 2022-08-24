Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A359F168
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:28:25 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQg80-0002CR-2S
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQg6d-0000l2-8p
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQg6Z-0003ZZ-R6
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFlaptdffaXljuF3EyN/vC12dioz00ktzFS6n9eYEG4=;
 b=e4cQi4sVFKgeJeDDkk9ulNqymc414J2IayWvs3f+vW5qkEXLN3mmfT5DBZQo4bxistIQzE
 ykVM5piaFZuP09g3ca3tZdqicui5EocrCrxpruijTNgEWiBjDtUTCV/a49GNcaeYzXdRV5
 vTEnwQGUWrNrEDn2pZMDl01nn8ASE04=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-lj4jUao9P9iz6DiFUU40hg-1; Tue, 23 Aug 2022 22:26:53 -0400
X-MC-Unique: lj4jUao9P9iz6DiFUU40hg-1
Received: by mail-lf1-f71.google.com with SMTP id
 d8-20020a193848000000b00492befa993cso4850702lfj.13
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YFlaptdffaXljuF3EyN/vC12dioz00ktzFS6n9eYEG4=;
 b=UVVt9OOCx4o5cO1a0pi53CVkOuUbo3PMNDbvD715Fzq8rV99PWwQkCrL23qFUaueV+
 Kk+9fl2Dd1t5k5QPITD7h2+Tcs2WTm2/BjsQv9u/GdzKGpPtIYolA+fGNMU4yqzIvS0o
 9ayucEZHMZfPC0D2/GjS8LC9o1y2UKZ/R0tWs5X0Kmtcx4IPdL5UjsOuEZDbc9giMNb7
 RE0aXYVU0NFmnvWPZ1yGrdG0NRhJPFD7DMmW8iGtCYrLQ3ePZe9kfNus3qcdt9jKwiRz
 EJmaCpF8JhjiXlK4Q1Aq59hOWD2xCf2u+cFzI//2o76MKc8KuecaZPktMiWfGWS2PfFz
 BRWA==
X-Gm-Message-State: ACgBeo1y3eB86BYS8nspKDou/lunLGWtbDVLuZLohyczW3y04SzDLCYe
 CAeUap0zYwb9LphB+1Pddb1wweP2DsWxv4K2WfVY5pO0oJ+McdOadppd5RspG3YcI/lM4dkE6id
 I7ziQw544eRXYrkXeHpvGsr2EMIDa5o4=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr8023093lfb.238.1661308011819; 
 Tue, 23 Aug 2022 19:26:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57rXrE1b48xJc4zDxNp+uDZGKI6JdI3t/JfiLwmujI3R+f3A1Ppy+bMsbLvEIlJMMYl6ApSedzMu+gWnsAzgw=
X-Received: by 2002:a05:6512:1518:b0:492:d08a:a360 with SMTP id
 bq24-20020a056512151800b00492d08aa360mr8023084lfb.238.1661308011535; Tue, 23
 Aug 2022 19:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220821122943.835058-1-zheyuma97@gmail.com>
In-Reply-To: <20220821122943.835058-1-zheyuma97@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Aug 2022 10:26:40 +0800
Message-ID: <CACGkMEtFXdV-M8dPm_kW9y7CWRjzU-GRh=W2Qo-bq4PGQuOOGA@mail.gmail.com>
Subject: Re: [PATCH] net: tulip: Restrict DMA engine to memories
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Sven Schnelle <svens@stackframe.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 21, 2022 at 8:29 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The DMA engine is started by I/O access and then itself accesses the
> I/O registers, triggering a reentrancy bug.
>
> The following log can reveal it:
> ==5637==ERROR: AddressSanitizer: stack-overflow
>     #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
>     #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
>     #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
>     #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
>     #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
>     #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
>     #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
>     #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
>     #8 0x5595435fb082 in dma_memory_rw_relaxed /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:87:12
>     #9 0x5595435fb082 in dma_memory_rw /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:130:12
>     #10 0x5595435fb082 in dma_memory_write /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:171:12
>     #11 0x5595435fb082 in stl_le_dma /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:272:1
>     #12 0x5595435fb082 in stl_le_pci_dma /home/mzy/truman/third_party/qemu/include/hw/pci/pci.h:910:1
>     #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
>     #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
>     #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
>
> Fix this bug by restricting the DMA engine to memories regions.
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Queued for 7.2.

Thanks

> ---
>  hw/net/tulip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 097e905bec..b9e42c322a 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
>  static void tulip_desc_read(TULIPState *s, hwaddr p,
>          struct tulip_descriptor *desc)
>  {
> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    const MemTxAttrs attrs = { .memory = true };
>
>      if (s->csr[0] & CSR0_DBO) {
>          ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
> @@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
>  static void tulip_desc_write(TULIPState *s, hwaddr p,
>          struct tulip_descriptor *desc)
>  {
> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    const MemTxAttrs attrs = { .memory = true };
>
>      if (s->csr[0] & CSR0_DBO) {
>          stl_be_pci_dma(&s->dev, p, desc->status, attrs);
> --
> 2.25.1
>


