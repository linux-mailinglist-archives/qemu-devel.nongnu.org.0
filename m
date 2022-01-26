Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBC49D298
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:38:45 +0100 (CET)
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCo7v-00010f-S9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCo5B-00072n-KK
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCo56-0007qg-Bt
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643225747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=i+6HDhdwTIzNrSuR9OZGv+awZPOffy557CFbp+vL2HM=;
 b=Hdqe1r4nMewWB/kthxDHkz1ss923HKPcJXOJ2KRiqz3iWfVQCP2D1AIaXmu4gUu7vm8QrI
 Ov4W6rSt4cZPR+p5HIxMhhNHRurK5it6Nne4JUXO69o+0/0dil+gyF1Y2pb/yZsXJ25A3z
 gBAIqJqLuES739Frlv9Z4Fnl6yz4V/8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-GdiIZE6IOJaukwR_78_MCg-1; Wed, 26 Jan 2022 14:35:45 -0500
X-MC-Unique: GdiIZE6IOJaukwR_78_MCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so2224515wme.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 11:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=i+6HDhdwTIzNrSuR9OZGv+awZPOffy557CFbp+vL2HM=;
 b=ZCwwTRB2/qhWRpNUy9Kn4DPqo8x1AmLhxmSi4fJcYtXKolx888eUYF4SlUcj9Z6M1j
 bsGvjnZTEh871zJyIH9l39L3BraLduq3uzJwXAIRwsKCI5dgFZdH1Wl0qyxipnrjdjv9
 sL4YUv2tc5jKRSf68vc9vp8G1174F7dQDDZ5Cg/bFa0UbAP9FnsuMiuCZYnLQkvktQKQ
 JW9AhQ+4t1aoCJ4guHpP9QfxeCNRfTSoH2gDC7dovMnxieoaImjkKl5OUpXHnvFKzaa1
 a4tIkzR6UhVcpONG+JxCiqnP849zUkHicI72uHyCcZatvMtMpS/rLYMUUJPAJMrjIu6o
 zs3w==
X-Gm-Message-State: AOAM5303XI41QjkZrsSRCWT4c5+yS8Nv5P0DUUIr651hYVUsm+W6fdRD
 BW5GmPd/VUTnbgU+GYPvLMRnZlJNER2kR6J7kgaksAA0IdVixW9eTtUbb/R0MBzJB0gL1IXczHV
 m1+1EJLj9r3bSgjM=
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr37494wrx.407.1643225744089; 
 Wed, 26 Jan 2022 11:35:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxASsGjWdVYCFhLHfAdlKwCMnybyxL24wJz2w/jLpJZKXX37x+oNrSh6d+a5RVQfYvdzEKWPg==
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr37473wrx.407.1643225743844; 
 Wed, 26 Jan 2022 11:35:43 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id f8sm197896wry.46.2022.01.26.11.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 11:35:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 3/3] migration/migration.c: Remove the
 MIGRATION_STATUS_ACTIVE when migration finished
In-Reply-To: <20211231055935.1878503-4-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 31 Dec 2021 13:59:35 +0800")
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-4-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 20:35:42 +0100
Message-ID: <87zgninvch.fsf@secure.mitica>
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
> The MIGRATION_STATUS_ACTIVE indicates that migration is running.
> Remove it to be handled by the default operation,
> It should be part of the unknown ending states.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


