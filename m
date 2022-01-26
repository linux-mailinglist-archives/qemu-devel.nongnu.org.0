Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A129A49D27E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:28:52 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCnyN-0000EE-5X
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCntF-0006bM-Ue
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCntD-0005kE-KB
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643225010;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NQsXnV07jfOA6kO8pLsorbUC8mpx/GQbpt/rVRTImt0=;
 b=ElfQsjWCQnkccp08u9qNSFQ2YAyikjoNisk646wqO/ajd7Q0Z8yLbMr8Uk6uaiAUWB8vbw
 0erJ1NiYMPKBq/6c+jW0lXZVOc43c/LkCRAs04h2v9PyEwMAiJjihEoCaMGgTxe1J7ZFtU
 j/wf+StN6zamhzGzp4EmwuqnrrYBGJs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-xL53NxMkMc6SgTPpMz2Rig-1; Wed, 26 Jan 2022 14:23:29 -0500
X-MC-Unique: xL53NxMkMc6SgTPpMz2Rig-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so227579wms.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 11:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=NQsXnV07jfOA6kO8pLsorbUC8mpx/GQbpt/rVRTImt0=;
 b=E5B1oe+/WuqasEQIJn8s9Euy88EX1rsT0paSdenibnA9dI2TJ8Rf9vtI8wJfTeiHGH
 Q4GRu1J/lMCoB5GamMyCkMtCHuvWBRdCKjTyAeCexUoK8cNujYs0AYuEDZnwiiqGoKN5
 vOiALy87V8XZPNRoMapNvwJSUYDXpaj+LZrCFjfqGUhSPycgdPW3g34fWM+OYbQhWmfN
 2grCJr13pVSqOtHM0WMwciSWcVxUo6QFlKAA8ThEeU5FvgwRsJN6TryVuLp+lrRMnW7g
 B9IpsWi9FmD1bO0FS3RFM/RtJ7nx9wu0HQeqj+eZCmiF8jZK5n7McCVkcmXCcJApE5in
 vs0Q==
X-Gm-Message-State: AOAM531NQ6Ytc+6YROcU+MXtoOMcW6BM9bZCG/gthnEb2rb+Xclfevwz
 96Q4kWP/jh4m/j8unLSS0zkcSSAL7ZlQFHHK99DPDsSRqox3OwVBY269BahOKr8qartUEFw1uTg
 B8UWU04fMU4EPh5E=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr50368wrz.600.1643225008174;
 Wed, 26 Jan 2022 11:23:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIjnPIjmg2hDWfRKitqjSH/Ir6beePacxkKtqusLfXAHGYszOrOk7U3vHqrZ7w6DRBkDTHzw==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr50353wrz.600.1643225007912;
 Wed, 26 Jan 2022 11:23:27 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id z3sm91233wmp.42.2022.01.26.11.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 11:23:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 1/3] migration/migration.c: Add missed default error
 handler for migration state
In-Reply-To: <20211231055935.1878503-2-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 31 Dec 2021 13:59:33 +0800")
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-2-chen.zhang@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 20:23:26 +0100
Message-ID: <87fspapahd.fsf@secure.mitica>
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
> In the migration_completion() no other status is expected, for
> example MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


