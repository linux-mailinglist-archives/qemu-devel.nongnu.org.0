Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32349D285
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:33:52 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCo3D-0004U9-DJ
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCo02-0002kA-H0
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCnzz-00076a-WD
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643225430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5Jy26FW5GsAoM/PWBTX6pE+45AQIuRKaASk8GnZl0/A=;
 b=WFHwwCZpeqjeQyOuemtvNkvUjsFS6Nn5KDRBhSG6SBCpFxAWmaWDIOBnRu2X5rSrvGNocb
 VxJXGTEWiNFXxeOnksoOpZpt9ln0yi2iexnQMv+IMBUVFWWFPA6ubWDOwKn8QY+Q4bRxMN
 7VCyicgyhrzX1x8rDNXHlEXwjFq+nBk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-yOFTcXcrOBe4GEKlHkUNsA-1; Wed, 26 Jan 2022 14:30:29 -0500
X-MC-Unique: yOFTcXcrOBe4GEKlHkUNsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m189-20020a1c26c6000000b003508ba87dfbso155701wmm.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 11:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=5Jy26FW5GsAoM/PWBTX6pE+45AQIuRKaASk8GnZl0/A=;
 b=xYCptgbzk6yQVyWZCT4CXdBxVsNNLSFippnX2YWuNqLiq+RKibS/aVNaQCoBjQO7R7
 b0+OAC2O8KqtS84gnlwV0h2px44gUtqmdIu3VN6OBAUSW97D2hEXH5mc4wWPj7dWvpJF
 XKrEcGbHUSLO7rTmSGU07oc6+5FJ27mzwGmd4/LN9S8GPrgywVD1Ed41pdJvCrO4R+Mg
 yM3YQ9uKAqCs4HOo9ZAMkhRqrWCfeaoa0vgYevYw3ozg5BGmyxoLSZi+BAQe8M5r8/ju
 qNkeMcaIhtC23twe840fEDGuMgtu5KMDOGIzh9zeqD4xNHL6rxbe6LR++g2SbNZ0W5yI
 S44g==
X-Gm-Message-State: AOAM531woGmnYjatcKD7suB1bM/kgINHvHywiwMFUOWpEcq156DthpIk
 EO+5tEHC3ZZ5SRZALqMA105yCmeStacv5wsAGUvOMaVVZsJAItA/kAtld7TQdrVbyg5MA0mc8mr
 8H15U6Gm3opxMLns=
X-Received: by 2002:a05:600c:3488:: with SMTP id
 a8mr155975wmq.173.1643225428457; 
 Wed, 26 Jan 2022 11:30:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTdbPIOgYt4MZ+sRG8HFoDYHrd+NmpWvg4dGp7p2/avlz0+Vv4OVMoeFVABF6T9Ev8O5sRew==
X-Received: by 2002:a05:600c:3488:: with SMTP id
 a8mr155957wmq.173.1643225428247; 
 Wed, 26 Jan 2022 11:30:28 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id t4sm136695wro.71.2022.01.26.11.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 11:30:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 2/3] migration/migration.c: Avoid COLO boot in postcopy
 migration
In-Reply-To: <20211231055935.1878503-3-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 31 Dec 2021 13:59:34 +0800")
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-3-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 20:30:27 +0100
Message-ID: <875yq6pa5o.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> wrote:
> COLO dose not support postcopy migration and remove the Fixme.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

fixed the typo.


