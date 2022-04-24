Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755050CFFA
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 08:19:02 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niVaG-0007mx-L9
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 02:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1niVWx-0006u3-0l
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 02:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1niVWt-0002E2-Lx
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 02:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650780929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/vn1txA1+flncn2bdLjaMuhSs+/Ee5ZH+0fIHfkn5w=;
 b=UR846Nif7j6WjzZUocfwMLN/0EISi1Yd8wtvmxID4kcUaKa1mtuyawDXWFcgDnuyoYhH4g
 uegvvdbbUzCkcbX5IZi1Watn8eiYyNRZDCG0R1LFnhXiOqVwalKLzFnrTKKlkQxIlY+RCa
 N732SikV0WoWeClM2TazBxSyLpF98K0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-tH7Ky8_nO4C3druokD2C6g-1; Sun, 24 Apr 2022 02:15:28 -0400
X-MC-Unique: tH7Ky8_nO4C3druokD2C6g-1
Received: by mail-lf1-f71.google.com with SMTP id
 h12-20020a05651211cc00b00471af04ec12so4874548lfr.15
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 23:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/vn1txA1+flncn2bdLjaMuhSs+/Ee5ZH+0fIHfkn5w=;
 b=mEsE7DmooJN70gqD/ZjnTnrqI43yw2lqCdGev1CidoLSNx9BdguYf/UtnNYqebL1Gi
 BuezzMmG659xw5eQnFMfFaevIxm9oNlrgxyOveFAcUc7mfBycyyLiobr9wWYZBB7jcrj
 XnTMn0OQscr+18uvxbNwzT80Baid/H30vaf8146XWwXRumzrPZPFJVwJz6LR7TImfdKc
 svQ2Csa9oRAeO+9ZavA3aHKYQD8Mf0nRxR2R7Jhi48WzgEyEuzrgWIjuFTvdRw5tR5AV
 K7R0yefd/gbQmLMn0c1CjFxRqTZC92HR2nNg8vXbPAj6sACzDWvnAboSMb/RDF4jjsQ/
 YK5g==
X-Gm-Message-State: AOAM5329IUApfIVUNXiiM9LJx1e75ic1uQnEeq09KLaFA6ZXPpKGQcdw
 Nhbzx8JIK+d4ItHRpzpOKDP1vjrKFZ7a5c/k5mf4qqyaQhqF4vGs/zWPIyhFzRs8Dq00yCut09q
 WvP5NgxXNaaezzO/PZm0b41pZb1XpAcw=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr8785770lfv.257.1650780926664; 
 Sat, 23 Apr 2022 23:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9SoprES8g3ZGVGr+UYHaxDZt6axwNPDHrAGVBL2GckY1MJC0Jq5kFCBxNl6aWFTN9GfhygqyogpjYboIu6kw=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr8785746lfv.257.1650780926407; Sat, 23
 Apr 2022 23:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220422055146.3312226-1-wei.huang2@amd.com>
In-Reply-To: <20220422055146.3312226-1-wei.huang2@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 24 Apr 2022 14:15:15 +0800
Message-ID: <CACGkMEuU-yvhyX9xxs1bv0GJncXeyLedsWOXJrLp48xDhgJwrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding
 errors
To: Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, mst <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 pbonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 1:52 PM Wei Huang <wei.huang2@amd.com> wrote:
>
> Coverity issues several UNINIT warnings against amd_iommu.c [1]. This
> patch fixes them by clearing evt before encoding. On top of it, this
> patch changes the event log size to 16 bytes per IOMMU specification,
> and fixes the event log entry format in amdvi_encode_event().
>
> [1] CID 1487116/1487200/1487190/1487232/1487115/1487258
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  hw/i386/amd_iommu.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index ea8eaeb330b6..725f69095b9e 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -201,15 +201,18 @@ static void amdvi_setevent_bits(uint64_t *buffer, uint64_t value, int start,
>  /*
>   * AMDVi event structure
>   *    0:15   -> DeviceID
> - *    55:63  -> event type + miscellaneous info
> - *    63:127 -> related address
> + *    48:63  -> event type + miscellaneous info
> + *    64:127 -> related address
>   */
>  static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
>                                 uint16_t info)
>  {
> +    evt[0] = 0;
> +    evt[1] = 0;
> +
>      amdvi_setevent_bits(evt, devid, 0, 16);
> -    amdvi_setevent_bits(evt, info, 55, 8);
> -    amdvi_setevent_bits(evt, addr, 63, 64);
> +    amdvi_setevent_bits(evt, info, 48, 16);
> +    amdvi_setevent_bits(evt, addr, 64, 64);
>  }
>  /* log an error encountered during a page walk
>   *
> @@ -218,7 +221,7 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
>  static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
>                               hwaddr addr, uint16_t info)
>  {
> -    uint64_t evt[4];
> +    uint64_t evt[2];
>
>      info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
>      amdvi_encode_event(evt, devid, addr, info);
> @@ -234,7 +237,7 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
>  static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
>                                     hwaddr devtab, uint16_t info)
>  {
> -    uint64_t evt[4];
> +    uint64_t evt[2];
>
>      info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
>
> @@ -248,7 +251,8 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
>   */
>  static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
>  {
> -    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
> +    uint64_t evt[2];
> +    uint16_t info = AMDVI_EVENT_COMMAND_HW_ERROR;
>
>      amdvi_encode_event(evt, 0, addr, info);
>      amdvi_log_event(s, evt);
> @@ -261,7 +265,7 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
>  static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
>                                         hwaddr addr)
>  {
> -    uint64_t evt[4];
> +    uint64_t evt[2];
>
>      info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
>      amdvi_encode_event(evt, 0, addr, info);
> @@ -276,7 +280,7 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
>  static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
>                                            hwaddr addr, uint16_t info)
>  {
> -    uint64_t evt[4];
> +    uint64_t evt[2];
>
>      info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
>      amdvi_encode_event(evt, devid, addr, info);
> @@ -288,7 +292,7 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
>  static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
>                                      hwaddr addr, uint16_t info)
>  {
> -    uint64_t evt[4];
> +    uint64_t evt[2];
>
>      info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
>      amdvi_encode_event(evt, devid, addr, info);
> --
> 2.35.1
>


