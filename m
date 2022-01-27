Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78F49DE75
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:52:16 +0100 (CET)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Rv-0006N1-6w
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1K2-000802-J9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:44:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1K0-0001Jz-PB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276643;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Zc6Tw4PQKievZmsIlG3igkEqcl3F2dFRZoAF+piYMU0=;
 b=VLBAJMosuBOeHtEXdLNABcZkk2airOu+X3rRFSOXkbaEr686Ty4p2+H7ZECTUdi86KkQtk
 gdpbr7gdP2yzhB+GD6k96F6jPMnBoDSbb9aCmDN+O9TEPYLDExwRVv7T3CaP5YP433VKQL
 NJiX2V9UhMnWwMi4doFi6gZ2e6LuEYg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-BmcIb27YPEewu0hzVDNz_Q-1; Thu, 27 Jan 2022 04:44:02 -0500
X-MC-Unique: BmcIb27YPEewu0hzVDNz_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso1225745wmb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Zc6Tw4PQKievZmsIlG3igkEqcl3F2dFRZoAF+piYMU0=;
 b=HLPKi0piZ+SWI5z0mEgANW/iuoOnpHwQf5+EeZzaNJ6hbxs19oQUY0KZFq/vaS1B0s
 xjJl2p/3gnvki5zn9Vot5bA4BdxNO9cLxlZiMw2Namyp54XI2YvXlWad4kFg4HNRfmkt
 r9c2fbn786demx9bhxEC7639TB21oSJv0OkvHPWbmaX/JWU0vKOUWwQnfs1ssUc2ohry
 cITPjWRy71AMjyg1w8LONW7yD4JPkPQHxUSIIAcHsNc9ZLd/bO/QNKChinS6l3SuYcl8
 Zny9ifvgfv5ugxkYfEYfMSa8EdSwxU63wMCJCrqHa+R9xZl2Wcnx2/0v21H3xKYN4exp
 jDJg==
X-Gm-Message-State: AOAM532htZ8u+qZT6KNukBsLk0+GEnUGnxZyB50xZyMRdoM7PrbylaiG
 11/SVTEuAkuhYiyjiEoo7ECD8Icxp1xV3aubVXFHpXzvMdw0mYo5QmUOeTzTCXvp2fFSKPnQByh
 t8VRNM5PqhLCF1xI=
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr2300371wrz.34.1643276640771; 
 Thu, 27 Jan 2022 01:44:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDIKwiIygPYTv5S/hZ8jA3QZXAmBrtd/PnH1m05DMXV0aoQmo932RLjvHgOZdDFkqvzd2pIQ==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr2300366wrz.34.1643276640630; 
 Thu, 27 Jan 2022 01:44:00 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id p8sm1945756wrr.16.2022.01.27.01.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:44:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/15] migration: Move temp page setup and cleanup
 into separate functions
In-Reply-To: <20220119080929.39485-7-peterx@redhat.com> (Peter Xu's message of
 "Wed, 19 Jan 2022 16:09:20 +0800")
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-7-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:43:59 +0100
Message-ID: <87h79pldi8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Temp pages will need to grow if we want to have multiple channels for postcopy,
> because each channel will need its own temp page to cache huge page data.
>
> Before doing that, cleanup the related code.  No functional change intended.
>
> Since at it, touch up the errno handling a little bit on the setup side.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


