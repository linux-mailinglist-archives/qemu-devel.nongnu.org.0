Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3C3A274F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:41:39 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGFv-0004x3-1R
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrG34-0008G4-3v
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrG32-0006h0-G4
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623313699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fSwOR1EDZMn7233WpK8HxXmxyEaH7M8sp6VfRPxpQo=;
 b=YI9sPZVcJK7t7Xaupz36UvGz5RKcfOOc02AtxsIANstSrqkkRV7DbuiMcgumig4lMJquqm
 dMwxW9G+1tcn+jx8c0B8oVW3Uc5p8bSelPlqzi+K/mU4Kt9NunpG8ZqMzJSsoMBBbNcPt3
 2qHXal4qJsb8+fjksmYj/ifnECVYv6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Vc2GT7M9M8yoDRl1vcnCTQ-1; Thu, 10 Jun 2021 04:28:16 -0400
X-MC-Unique: Vc2GT7M9M8yoDRl1vcnCTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 688E810068F1;
 Thu, 10 Jun 2021 08:28:15 +0000 (UTC)
Received: from work-vm (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 352D819D9D;
 Thu, 10 Jun 2021 08:28:10 +0000 (UTC)
Date: Thu, 10 Jun 2021 09:28:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/11] target/i386/sev: Remove sev_get_me_mask()
Message-ID: <YMHNF+UXR91d4D3F@work-vm>
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-7-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Unused dead code makes review harder, so remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Yes, it doesn't seem to have been used since it was added.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev_i386.h | 1 -
>  target/i386/sev-stub.c | 5 -----
>  target/i386/sev.c      | 9 ---------
>  3 files changed, 15 deletions(-)
> 
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index f4223f1febf..afa19a0a161 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -25,7 +25,6 @@
>  #define SEV_POLICY_SEV          0x20
>  
>  extern bool sev_es_enabled(void);
> -extern uint64_t sev_get_me_mask(void);
>  extern SevInfo *sev_get_info(void);
>  extern uint32_t sev_get_cbit_position(void);
>  extern uint32_t sev_get_reduced_phys_bits(void);
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index d91c2ece784..eb0c89bf2be 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -25,11 +25,6 @@ bool sev_enabled(void)
>      return false;
>  }
>  
> -uint64_t sev_get_me_mask(void)
> -{
> -    return ~0;
> -}
> -
>  uint32_t sev_get_cbit_position(void)
>  {
>      return 0;
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 83df8c09f6a..0a36e81f66c 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -64,7 +64,6 @@ struct SevGuestState {
>      uint8_t api_major;
>      uint8_t api_minor;
>      uint8_t build_id;
> -    uint64_t me_mask;
>      int sev_fd;
>      SevState state;
>      gchar *measurement;
> @@ -362,12 +361,6 @@ sev_es_enabled(void)
>      return sev_enabled() && (sev_guest->policy & SEV_POLICY_ES);
>  }
>  
> -uint64_t
> -sev_get_me_mask(void)
> -{
> -    return sev_guest ? sev_guest->me_mask : ~0;
> -}
> -
>  uint32_t
>  sev_get_cbit_position(void)
>  {
> @@ -810,8 +803,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>          goto err;
>      }
>  
> -    sev->me_mask = ~(1UL << sev->cbitpos);
> -
>      devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
>      sev->sev_fd = open(devname, O_RDWR);
>      if (sev->sev_fd < 0) {
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


