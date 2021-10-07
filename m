Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D644257FF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:31:29 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWIk-0001Va-0U
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYWBa-0000if-4y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:23:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mYWBY-0000ay-BB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmwLsF9obeBKpmt0bFLMFKj9ljedivTYCFvv9GIiOtM=;
 b=HCtpHQriHIvRewrhjmEkV7pLIasSs+um9hNIQh7veT+Nr3GFlXKPdXIxe4sXTH8z7uJnTn
 vFSm/FRnEbUTj432hoH5ZQC5iYdZ45+OSBuRf/rirl1pi3qbp3wXLxWDmNpGKuNbHEEKje
 OpN3KeMbuLoW3WmjRhB+V9Tbruyz32o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-5Zx5iFBsPEC5QTWFIvQP7g-1; Thu, 07 Oct 2021 12:23:50 -0400
X-MC-Unique: 5Zx5iFBsPEC5QTWFIvQP7g-1
Received: by mail-wr1-f72.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so5127603wrt.23
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=AmwLsF9obeBKpmt0bFLMFKj9ljedivTYCFvv9GIiOtM=;
 b=GqyV0a5Gv2Ixo2tI5scLM5BXK+0GSd7EL6v5hMk5fWnpiQC+I4OjfRJpQw6IrcBfpa
 rIg7X7H6wORBy+ab3jZpuy6dpUzoKRCfWE8BPb3UOQZ8KsmGgq6cIyN06+VZWS6ySLIa
 UkOAvfoXisL/KZormxsrEZHT5YJvu21yN/wVeRAbOV0SJAh3N4/DyD4g2mr2HtsQHjd9
 v9T7e17qT8PCKDUAI3LzLuW85wLULknu/+LpkWBtJFV0ghjWihgDOmdg2FOePbzI35Ay
 NCdqNT0q2YhNtSHp6KUymtY1i1XA73NDOFaBl2gxEnV6DljGL4KXvUjz1nnwEXkERDmk
 N77Q==
X-Gm-Message-State: AOAM53074r+QbIGRj2GK15lpP93qA6HbVxa9poJPC0dgHT/LQamBYEP2
 q5wqSMWFjBmgiJya55Cp2AJYugeX7aYSdPIY2p7Sni11GeQXFmDTL5ELNjK/O61I7DpYic1xZcg
 qpKRlOtoZ0lOUekE=
X-Received: by 2002:a1c:f405:: with SMTP id z5mr17305424wma.33.1633623829238; 
 Thu, 07 Oct 2021 09:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrkYTwlvgA3cm/U+NS4vkRGotTH4a3KcWvcpenrkvTNxWSZZ9rsdA8miKnbr5qEa0hE4o9Eg==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr17305399wma.33.1633623828953; 
 Thu, 07 Oct 2021 09:23:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f1sm118958wri.43.2021.10.07.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:23:48 -0700 (PDT)
Date: Thu, 7 Oct 2021 17:23:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 05/23] target/i386/sev: Prefix QMP errors with 'SEV'
Message-ID: <YV8fEsQYcWgf9nGS@work-vm>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211007161716.453984-6-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Multiple errors might be reported to the monitor,
> better to prefix the SEV ones so we can distinct them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/monitor.c |  2 +-
>  target/i386/sev.c     | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 196c1c9e77f..eabbeb9be95 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -717,7 +717,7 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
>  
>      data = sev_get_launch_measurement();
>      if (!data) {
> -        error_setg(errp, "Measurement is not available");
> +        error_setg(errp, "SEV launch measurement is not available");
>          return NULL;
>      }
>  
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index bcd9260fa46..4f1952cd32f 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -440,7 +440,8 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
>      r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
>      if (r < 0) {
>          if (err != SEV_RET_INVALID_LEN) {
> -            error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
> +            error_setg(errp, "SEV: Failed to export PDH cert"
> +                             " ret=%d fw_err=%d (%s)",
>                         r, err, fw_error_to_str(err));
>              return 1;
>          }
> @@ -453,7 +454,7 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
>  
>      r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
>      if (r < 0) {
> -        error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
> +        error_setg(errp, "SEV: Failed to export PDH cert ret=%d fw_err=%d (%s)",
>                     r, err, fw_error_to_str(err));
>          goto e_free;
>      }
> @@ -491,7 +492,7 @@ sev_get_capabilities(Error **errp)
>  
>      fd = open(DEFAULT_SEV_DEVICE, O_RDWR);
>      if (fd < 0) {
> -        error_setg_errno(errp, errno, "Failed to open %s",
> +        error_setg_errno(errp, errno, "SEV: Failed to open %s",
>                           DEFAULT_SEV_DEVICE);
>          return NULL;
>      }
> @@ -557,8 +558,9 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>              &input, &err);
>      if (ret < 0) {
>          if (err != SEV_RET_INVALID_LEN) {
> -            error_setg(errp, "failed to query the attestation report length "
> -                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> +            error_setg(errp, "SEV: Failed to query the attestation report"
> +                             " length ret=%d fw_err=%d (%s)",
> +                       ret, err, fw_error_to_str(err));
>              g_free(buf);
>              return NULL;
>          }
> @@ -572,7 +574,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
>      ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
>              &input, &err);
>      if (ret) {
> -        error_setg_errno(errp, errno, "Failed to get attestation report"
> +        error_setg_errno(errp, errno, "SEV: Failed to get attestation report"
>                  " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
>          goto e_free_data;
>      }
> @@ -596,7 +598,7 @@ sev_read_file_base64(const char *filename, guchar **data, gsize *len)
>      GError *error = NULL;
>  
>      if (!g_file_get_contents(filename, &base64, &sz, &error)) {
> -        error_report("failed to read '%s' (%s)", filename, error->message);
> +        error_report("SEV: Failed to read '%s' (%s)", filename, error->message);
>          g_error_free(error);
>          return -1;
>      }
> @@ -911,7 +913,7 @@ sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
>      if (sev_check_state(sev_guest, SEV_STATE_LAUNCH_UPDATE)) {
>          int ret = sev_launch_update_data(sev_guest, ptr, len);
>          if (ret < 0) {
> -            error_setg(errp, "failed to encrypt pflash rom");
> +            error_setg(errp, "SEV: Failed to encrypt pflash rom");
>              return ret;
>          }
>      }
> @@ -930,7 +932,7 @@ int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
>      MemoryRegion *mr = NULL;
>  
>      if (!sev_guest) {
> -        error_setg(errp, "SEV: SEV not enabled.");
> +        error_setg(errp, "SEV not enabled for guest");
>          return 1;
>      }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


