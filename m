Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8151668F975
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrbh-0002jv-Pl; Wed, 08 Feb 2023 16:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPrbf-0002jU-3h
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPrbd-0005WZ-Kx
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCTpMtpnUQMYO5fSFzeHb23MwsgacBflCtmErm7Il90=;
 b=XoxOHoD6AbSFSk0ZU+1keNvrVrST4oDlfkTLvt8rS6bvVEkf34z6PdyLxxcsDEumQ0rFbh
 0kJZSuGtg/8t5N4eSwbtNPsLQgvD7QAgzUu57xbnDfggaR1gGNWfsUuEI9TuiWeH3moLgG
 IlC2zjtgfCGW/n2/m/6+W5WTkS3K844=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-MbBQkti1PVqOrhmYsmgBUQ-1; Wed, 08 Feb 2023 16:03:51 -0500
X-MC-Unique: MbBQkti1PVqOrhmYsmgBUQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 j5-20020a0ceb05000000b0056bfe6a5bf3so54741qvp.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCTpMtpnUQMYO5fSFzeHb23MwsgacBflCtmErm7Il90=;
 b=RLjygJi8krro/t9aZVNUNnyaDcjM1d/5LlUdLIgDkcs3vwD//L7IQFcAtroBJbgO0/
 BUA6Mrxu8YrbmsAXaKwPed8Udzg8ASnOmi1ynAmDIufXYWySseMVgI1CY2h+0Dz1EJRy
 facxqEvT9MFnbpwzr/gC8wGrlat2h7+VRLggolIuVtKR7uCJiPqMTaRXhjF92uD5expG
 xkuOY0ZDXAcshnU1oKKIE2M2f7KjQgAkSJ1g1OpWOoQ7YDgnaTjA1FrEXd6HsXt+fh5G
 7GCYnOakOxAZiJw9yrKKtCKfhF2uShNygQ5iHGdwJ9QQixg+VWp03UyTOwgi0Fk8EZpM
 TeLQ==
X-Gm-Message-State: AO0yUKVtmFNt0liiiaoI9yvtWqzHafM3PYJicirU7EyU2Cwz48QzVixM
 F8rHXUGNoj79wV41VDyPKzfmEzBQTBogx84VH3TORPCvidCZQtL16YqJIFxSsjWivgfHZ2aJiy2
 nhycSD2W4qG3S8Qqyc77i7pz3IMB9ps+1C3RMS6s/0HePX3bS9LYggCHjJNPR1Ueec8KQiA==
X-Received: by 2002:a05:622a:1452:b0:3a9:86dd:3c5d with SMTP id
 v18-20020a05622a145200b003a986dd3c5dmr15664710qtx.5.1675890225765; 
 Wed, 08 Feb 2023 13:03:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+Oh5TTuFJsoQitXzUzpBPOXyjBZtnqkIb6SjH6OyUo0DTo1F/+SMRACI6Xa5e8sXgPRzR/xg==
X-Received: by 2002:a05:622a:1452:b0:3a9:86dd:3c5d with SMTP id
 v18-20020a05622a145200b003a986dd3c5dmr15664668qtx.5.1675890225429; 
 Wed, 08 Feb 2023 13:03:45 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05620a057400b0073294bcba54sm7830674qkp.96.2023.02.08.13.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:03:30 -0800 (PST)
Date: Wed, 8 Feb 2023 16:03:29 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v3 0/4] migration: Fix disorder of channel creations
Message-ID: <Y+QOIbYxOykKfP7t@x1n>
References: <20230208202813.1363225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208202813.1363225-1-peterx@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 03:28:09PM -0500, Peter Xu wrote:
> v3
> - Fix indent for uri_supports_multi_channels() [Juan]
> - Rename migration_uri_validate() to migration_channels_and_uri_compatible() [Juan]
> - Separate the changes to migrate_postcopy_preempt() into separate patch [Juan]

Sorry, Juan, I lost your R-bs on patch 3-4.  They should be exactly the
same as before.

-- 
Peter Xu


