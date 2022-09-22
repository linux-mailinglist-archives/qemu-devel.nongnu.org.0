Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692505E6A1B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:58:54 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQTM-0001hb-H3
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obP4Y-0004Yq-1M
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obP4U-00006n-QY
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663864145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k12gsWGwrNBFPSSZ6XW1GKyOrXQ8qE7eXyN/jLntquQ=;
 b=X5S0jJiNkkKrkNKNCWd5IjxBfxWEVhE/Wbv9lFNucJUuIRa4Z5Zy+dt5FHPYVjN/BZ0Atf
 CEV1NB13FhxNbmhM2gjW9fCGX870i21plOyxdl9oSdYIz/6O3Q6bKQBRjda59dP99QAiVJ
 rUb53eCXWoxDMLuyvOZHj0sl1Y3+iCs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-TaNY5FbwNoueBvD4oBtaZQ-1; Thu, 22 Sep 2022 12:29:04 -0400
X-MC-Unique: TaNY5FbwNoueBvD4oBtaZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso3415652wra.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k12gsWGwrNBFPSSZ6XW1GKyOrXQ8qE7eXyN/jLntquQ=;
 b=KyUJQnAjjT84srTFsb7fRdUqwRKjOwCi5w1b55v24V2juDSpxYhL1z4w6NwHIb0Joa
 FXyQoSA/vvHwNwn5IIX20Mxl1YxmUviPXptS5jhr7vpht45Jfwg3/2pdaTsYna91daky
 9Yh7khvPEhe7KBWvm/sFxgngNDHIQL4ocP+5QUEtakIPFZ6K3mRMBJUbLnnOANqdCibM
 Gp846mNVjLOLk03Zv7G/pU3Un9jFeI9Mg/JkCDRsUDyJYqi1bp08U7EzO25WBD1ZfbdV
 S0RV2dRkq60VMNYsEOg2PI4/bLD1gGCl0i+EhjAW2n3rp5WdjgaPkzLSB7zhSbq1HNmY
 xPYg==
X-Gm-Message-State: ACrzQf1nTUiMLil/nP3pbHKveWTrsSy6Gq8JWxqD+stycguz+gDMX8Kh
 904ExclLDESUXvZfKxOzwAQ8I1uQjmb3scxFxyFrP/mF+DCOOscHm7sjlX92Wov8GZaesVoWRDR
 vfxZs7OWzkgUO1vs=
X-Received: by 2002:a05:6000:184:b0:22a:cb6f:bb52 with SMTP id
 p4-20020a056000018400b0022acb6fbb52mr2562622wrx.500.1663864143653; 
 Thu, 22 Sep 2022 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5W9cS0WLMNE2LNIipaMi72sgTDbTDUIUQ8z+6FiscuMkl+mZ3EPT6z9lPDBSnbPrmf0CXDkg==
X-Received: by 2002:a05:6000:184:b0:22a:cb6f:bb52 with SMTP id
 p4-20020a056000018400b0022acb6fbb52mr2562613wrx.500.1663864143423; 
 Thu, 22 Sep 2022 09:29:03 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x13-20020adff0cd000000b002205cbc1c74sm5225480wro.101.2022.09.22.09.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:29:02 -0700 (PDT)
Date: Thu, 22 Sep 2022 17:29:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 4/5] migration: Disallow postcopy preempt to be used with
 compress
Message-ID: <YyyNTHPgEZaG/UJW@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920223800.47467-5-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Peter Xu (peterx@redhat.com) wrote:
> The preempt mode requires the capability to assign channel for each of the
> page, while the compression logic will currently assign pages to different
> compress thread/local-channel so potentially they're incompatible.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index fb4066dfb4..07c74a79a2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1341,6 +1341,17 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy preempt requires postcopy-ram");
>              return false;
>          }
> +
> +        /*
> +         * Preempt mode requires urgent pages to be sent in separate
> +         * channel, OTOH compression logic will disorder all pages into
> +         * different compression channels, which is not compatible with the
> +         * preempt assumptions on channel assignments.
> +         */
> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
> +            error_setg(errp, "Postcopy preempt not compatible with compress");
> +            return false;
> +        }
>      }
>  
>      return true;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


