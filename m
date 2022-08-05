Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DDF58A983
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:34:11 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuef-0006eH-87
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJu4e-0001h1-Kj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:56:56 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJu4c-0004Je-VD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:56:56 -0400
Received: by mail-yb1-xb32.google.com with SMTP id 123so3033394ybv.7
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+tYwyoPC/UYjEl3VLnfxE7p+sOF0NI9w86gIN535Lok=;
 b=T7YsH+zPcw3Pd0x2AUzDO4gt+Sp8Roi2RLl0GW9kny8rtq+9GLnvr9ZeabKvT84fny
 WIE/sKtM3/k/tfttanSWXt5XL/dSR1XzM6rpmAoLt2lXroaEL6cuRrmTMNFDYOTQ2Pl3
 VG6ul3zmYABF7gS101al3JtivXEYpmmsvGRbEU9nX8SK5Fpr22K/Pd4xLjrkCwC7mehi
 Sp8jO10mWKu/TBe0AXLG7PcnjASoycChJxliAMvukIJ3oKcY/OcOvDzv9uDdwNnuqW9B
 Iy4MqnOfYEdKGakKpehRniAjlbv5KPdfoemJEfezryb4iaEfpTDMMkeXXWS/vMqD4kP0
 PgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+tYwyoPC/UYjEl3VLnfxE7p+sOF0NI9w86gIN535Lok=;
 b=HI4jA+o22uZb1N+NiOFAZI43ZCZoYMWJWQhte7W36DII/zESHvP73IK2ZM9SnWPiar
 xfJy9sLEjpMiS4XGDhRCkzX+6kRDXP5gV2Scf0Y/dfhsVE58wJfuUjaBeZOblPKXTDcS
 8B4XFdOQaspCCM+iTJ40hUOmmdTCP1+OB6B/8TyqyrpJzmFm60mcM37q2ODVFduo5cgs
 v9W2ApWRYXZDh5KZ0wiLFBGfRh4UD28sl09YhBce1xl2ae1GkcjCop6Ckad9R4YNJQ3+
 0lWscbglIMiVTG2Lc5S3galJn/ORGtQ3Ie0ivcCBf0U4s+sNa+pt8IRb1WTJfbAhxft5
 Kteg==
X-Gm-Message-State: ACgBeo0eySMnVfn/Kj3/7CHn+V5/44iXm9IdrhHw3OEQeccokpdfMz4O
 V5JkSRaLc4fm6kI5xq56nrVw8VzW8X1l8SAT360nHA==
X-Google-Smtp-Source: AA6agR6nJCJYGtnJq5uvKzNhcOcVTHxzeU7pgQnjudfzCnAuiY5Yn3Mh6VuCr7l7+cKJYqwkM6+1+gCXq0wIi2/VSls=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr4727376ybn.479.1659693413798; Fri, 05
 Aug 2022 02:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220805093813.119839-1-chen.zhang@intel.com>
In-Reply-To: <20220805093813.119839-1-chen.zhang@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 10:56:42 +0100
Message-ID: <CAFEAcA-xwDEX2EMC1DUP0vBvx_sGLvT5zAN2FnDi0DWwOSWWUg@mail.gmail.com>
Subject: Re: [PATCH V2] net/colo.c: Fix the pointer issuse reported by
 Coverity.
To: Zhang Chen <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, 
 qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 5 Aug 2022 at 10:53, Zhang Chen <chen.zhang@intel.com> wrote:
>
> When enable the virtio-net-pci, guest network packet will
> load the vnet_hdr. In COLO status, the primary VM's network
> packet maybe redirect to another VM, it need filter-redirect
> enable the vnet_hdr flag at the same time, COLO-proxy will
> correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse
> the packet, the data+offset will point to wrong place.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..524afa3d9b 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,22 @@ int parse_packet_early(Packet *pkt)
>  {
>      int network_length;
>      static const uint8_t vlan[] = {0x81, 0x00};
> -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data = pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>
> -    if (data == NULL) {
> -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> +    assert(data);
> +
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
> +        + pkt->vnet_hdr_len) {

I think this expression needs more care to avoid overflow
with a maliciously over-large vnet_hdr_len value.

Casting pkt->vnet_hdr_len to int64_t would be one way to do that;
there may be better approaches.

thanks
-- PMM

