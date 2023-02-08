Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A956268FA25
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:16:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsj2-0008Ps-A2; Wed, 08 Feb 2023 17:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsiy-0008PV-UP
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsiw-0002px-Kw
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894529;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=B53NmdqCvkrPvcPa2hEkYAIXEfY0QzMpgY0bg0tEAeA=;
 b=ZzkBtIKy+kAjG9XWXqTdCX/3hZoq+l5thMRG2QwrnR83MJEDqxWbr90d4hBXIkWnyDAU7F
 npRalNPyeC4BdcVZREjK8UwCtgg04L+/X5uQUEQRGDMLF0RBCCVUbGlrLIuvl+sc+uMUap
 Y2jWA56exfpoTbz0mtkz3XFqoizXo+c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-mKHDs5qAOfWpRr_cXzX80Q-1; Wed, 08 Feb 2023 17:15:25 -0500
X-MC-Unique: mKHDs5qAOfWpRr_cXzX80Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 s11-20020a05600c384b00b003dffc7343c3so77950wmr.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B53NmdqCvkrPvcPa2hEkYAIXEfY0QzMpgY0bg0tEAeA=;
 b=lwYZgiQ8xPhxtCACwTF10Zu18gv/QXiMj2sczly1ZH7TRSNWnoM7FfKjNsaqH3xV5t
 gK53mMtTEsBAxTdALkBVnC+TcrfvKhqtfWqnfkJ/NsKwC5HFRE6c7WTd1rWihVJfTNof
 ueV0X7kWPIEz5uUzzCLMFnBq5BSDh9RTUXyFB15o7Zi5pDAZwt/1M0sK0+t8LtYpZNb8
 /MoGRou0YuSJ7DIN+ISZBDvHlIJxeWYU0Rh4DeIoEVoxJ1dRM8UXSVRVZQfWWdETdU1D
 yxGle8PgdbJcqm+1gKHtYCsA0jLw68bA3u6wCmwavbquhgD5JuqKOCOZVfMM9QWV/2P1
 +5VQ==
X-Gm-Message-State: AO0yUKU1mWG0ao5rZDn680GgVl1M3OCiNqXAyrkd94YvYeI+aW7/mShc
 UrxGZ7ecOyv16wrIPSTzYzvl07cFJDgtoKZzbx7up2Q8eyeMXriJuTtlSlPSsEiNPblRExttmon
 2b1lGWn5ehtX77Y0=
X-Received: by 2002:adf:fb05:0:b0:2bf:b199:c7ef with SMTP id
 c5-20020adffb05000000b002bfb199c7efmr7696639wrr.12.1675894524691; 
 Wed, 08 Feb 2023 14:15:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZbTeRhlJSTeGxIWSZ8Q8saHjv57ddy0T9BIWRhzgiiBtc7TOyDdE8r5U6zWhBqhW5HO/qNg==
X-Received: by 2002:adf:fb05:0:b0:2bf:b199:c7ef with SMTP id
 c5-20020adffb05000000b002bfb199c7efmr7696622wrr.12.1675894524445; 
 Wed, 08 Feb 2023 14:15:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d3-20020adfef83000000b002c3daf229b1sm13018491wro.55.2023.02.08.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:15:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 8/8] kvm: Enable dirty ring for arm64
In-Reply-To: <20230206112010.99871-9-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:10 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-9-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:15:22 +0100
Message-ID: <87357f9539.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gavin Shan <gshan@redhat.com> wrote:
> arm64 has different capability from x86 to enable the dirty ring, which
> is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. To enable it in kvm_dirty_ring_init()
> when KVM_CAP_DIRTY_LOG_RING isn't supported.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


