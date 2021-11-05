Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FF4462D5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:37:08 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixWt-0002Fy-Fo
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mixVf-0000jv-UL
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mixVe-0007wr-2f
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636112149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb8tl6wVSL5vtHmSU1Q1+gc6S+NkBNymOaF9E1wsqks=;
 b=MTNAeovIdMzTybe86CYjb1peQ10MkuYwvyGUUN2aahTGBQW+8gWGF/B97IBA9P1ZEOnRC4
 nJLUo3BOOfo0H5msn/OJyu/d+rPNeO03/d3Yaqlz71rbJKr181ZJdgWpnJTDXBL2rOVYWE
 MoQ45fmE5JfIcuma5CKZjjJnZ6vLsTI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-Bvzh95klPWeclcQLH_8jDA-1; Fri, 05 Nov 2021 07:35:46 -0400
X-MC-Unique: Bvzh95klPWeclcQLH_8jDA-1
Received: by mail-wm1-f69.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso5594862wmb.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eb8tl6wVSL5vtHmSU1Q1+gc6S+NkBNymOaF9E1wsqks=;
 b=ojxh1z8jJpWNbMiP8oJRAWx8LcyfwZPJvIc83ExgJMyFWgs4U0M+JlU06d6rZs5qPC
 WM1j/xDfS15/MhSlzwis8oqsjIfvFC8FqLDskVCx5sNSK69uTA2lokbo6F3N0Jv67DX3
 V4WarQlgYhKK8wdxmX3YQoPBvlhWnrW8k5Swz/a9OekQHUQvLWOtj6EPb2npEIvnXa5S
 I6nI59dhreU79sB9M72kqCXumPPd7JQTtoY+dTj3s9syqpoAY7gKEJtXP6SvQzjCKGY5
 qMMrBhWq7LTDk9Tl1YXLA5lhYwhBQ29/kA6bAURpX4u9SeUeCKQ/cAb83Jn23Lm7NB5O
 hv3A==
X-Gm-Message-State: AOAM531SozJpR90SQ/Y3pplEdY9PUFv40uwZ0z8g/CSMUuIo4Ru175tQ
 VmvmiqnRTggF/FKnnDXmSYsu5w8qpdJlxbcqU80lS9BUrlw/eDKa1WxqjPUtLYVU3ylDVSpTmVi
 t2RMOm5j9K3hDfW0=
X-Received: by 2002:a5d:5988:: with SMTP id n8mr11641707wri.309.1636112145511; 
 Fri, 05 Nov 2021 04:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ/zreXvSQLsmKE10YEGHxQUJz3vCeJ+tdqyNOYM62lm+slnI0gxypfkn5toj+LDJZSRdX7Q==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr11641678wri.309.1636112145282; 
 Fri, 05 Nov 2021 04:35:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r15sm8061223wru.9.2021.11.05.04.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 04:35:44 -0700 (PDT)
Message-ID: <ff73eb99-0ead-9365-ce60-82a84296398a@redhat.com>
Date: Fri, 5 Nov 2021 12:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v2] hw/scsi/scsi-disk: Fix out of bounds access in
 mode_sense_page()
To: Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20210204225041.1822673-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210204225041.1822673-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Darren Kenny <darren.kenny@oracle.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems this became CVE-2021-3930.

https://bugzilla.redhat.com/show_bug.cgi?id=2020588#c0

On 2/4/21 23:50, Philippe Mathieu-Daudé wrote:
> Per the "SCSI Commands Reference Manual" (Rev. J) chapter 5.3
> "Mode parameters" and table 359 "Mode page codes and subpage
> codes", the last page code is 0x3f. When using it as array index,
> the array must have 0x40 elements. Replace the magic 0x3f value
> by its definition and increase the size of the mode_sense_valid[]
> to avoid an out of bound access (reproducer available in [Buglink]):
> 
>   hw/scsi/scsi-disk.c:1104:10: runtime error: index 63 out of bounds for type 'const int [63]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/scsi/scsi-disk.c:1104:10 in
>   =================================================================
>   ==1813911==ERROR: AddressSanitizer: global-buffer-overflow
>   READ of size 4 at 0x5624b84aff1c thread T0
>       #0 0x5624b63004b3 in mode_sense_page hw/scsi/scsi-disk.c:1104:10
>       #1 0x5624b630f798 in scsi_disk_check_mode_select hw/scsi/scsi-disk.c:1447:11
>       #2 0x5624b630efb8 in mode_select_pages hw/scsi/scsi-disk.c:1515:17
>       #3 0x5624b630988e in scsi_disk_emulate_mode_select hw/scsi/scsi-disk.c:1570:13
>       #4 0x5624b62f08e7 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1861:9
>       #5 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #6 0x5624b62b2d4c in scsi_req_data hw/scsi/scsi-bus.c:1427:5
>       #7 0x5624b62f05f6 in scsi_disk_emulate_write_data hw/scsi/scsi-disk.c:1853:9
>       #8 0x5624b62b171b in scsi_req_continue hw/scsi/scsi-bus.c:1391:9
>       #9 0x5624b63e47ed in megasas_enqueue_req hw/scsi/megasas.c:1660:9
>       #10 0x5624b63b9cfa in megasas_handle_scsi hw/scsi/megasas.c:1735:5
>       #11 0x5624b63acf91 in megasas_handle_frame hw/scsi/megasas.c:1974:24
>       #12 0x5624b63aa200 in megasas_mmio_write hw/scsi/megasas.c:2131:9
>       #13 0x5624b63ebed3 in megasas_port_write hw/scsi/megasas.c:2182:5
>       #14 0x5624b6f43568 in memory_region_write_accessor softmmu/memory.c:491:5
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1914638
> Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Mention reproducer link
> ---
>  hw/scsi/scsi-disk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index ed52fcd49ff..93aec483e88 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1089,7 +1089,7 @@ static int scsi_emulate_mechanism_status(SCSIDiskState *s, uint8_t *outbuf)
>  static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>                             int page_control)
>  {
> -    static const int mode_sense_valid[0x3f] = {
> +    static const int mode_sense_valid[MODE_PAGE_ALLS + 1] = {
>          [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
>          [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
>          [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
> 


