Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A528249B9E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:16:08 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPQN-0001wC-7k
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:16:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPIO-0005sz-KN
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCPIL-0004MO-8M
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643130468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S0Dlq2QlfbDpy0ebdUM3JOZYv/f7sucWh/K09bC/NLE=;
 b=VK6BPR7iNTHatGgnmZEvDYmhsIj5HYMHvDllaWEvXzKRHIwZXiILSLRoyqfwf1oaWcW3ye
 jILFiRxm3UM+NHEHhbIPRB8wfiI1j5i5vAE5Talq7CjSvWEFkcM57It/qtcWS+R98xsqNx
 MNAbMfURxfBhOybKdmd7Tmn/T68m4gY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-tITUsjQAMimq0VvALhRzeg-1; Tue, 25 Jan 2022 12:07:47 -0500
X-MC-Unique: tITUsjQAMimq0VvALhRzeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso1769506wmc.8
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 09:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=S0Dlq2QlfbDpy0ebdUM3JOZYv/f7sucWh/K09bC/NLE=;
 b=FXG7V4sLgZj6/1/iTNNtcE3Lxmcw5wFbazYcv2BF4kZYaxzBdB2f5TCI/+hkkEwnIy
 ZwK5/iVaXU6ya+IuMXeP0nhNXffGxnEhOxNxciZgZg5Cq99JOQogxX82wVgnPKXA/aMy
 zxPDwqslAQjD8tFD0AA9+/6IJKsDO6HpqTCPp6eSLr4QP4RNY2XxJsaCk7HHqD99TBzg
 Q+WRzCxkiDVcIlfTVBV+RnnOCunboNhafSAleG9DKOghK3QCxCK9tHQq8UQt+Up6TXD3
 QyH3x+I4d3axes2kuFuXzKFdJagGxBxsnxoXS8AEvfZVK3dzJZSf1IYA2EFS94KLvGnn
 pxtw==
X-Gm-Message-State: AOAM530hgtuC9GMi/IgGaN0nU3OhRXz/h9zmU1G7nfsq09Z0PVGvw0MW
 UQpbHssAL/3HlpON3Fg7M85xgFK1r6cC/XU0ZYj0jAngg+o7TeliKIDMPjf93NVckoYD/dqwmxa
 zKq+XE7CF1FXSjbI=
X-Received: by 2002:adf:f14a:: with SMTP id y10mr18440995wro.145.1643130466274; 
 Tue, 25 Jan 2022 09:07:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsKaM2WE7TscaGiVxfk20ujjIJXMhVRfshcyjxvJyMGxktJ/DonfthgOtIvGFjP1KNLeRxwA==
X-Received: by 2002:adf:f14a:: with SMTP id y10mr18440977wro.145.1643130466071; 
 Tue, 25 Jan 2022 09:07:46 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id a24sm837960wmm.31.2022.01.25.09.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:07:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Remove unnecessary minimum_version_id_old fields
In-Reply-To: <20220118104434.4117879-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Tue, 18 Jan 2022 10:44:34 +0000")
References: <20220118104434.4117879-1-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 18:07:44 +0100
Message-ID: <87wninpwv3.fsf@secure.mitica>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> wrote:
> The migration code will not look at a VMStateDescription's
> minimum_version_id_old field unless that VMSD has set the
> load_state_old field to something non-NULL.  (The purpose of
> minimum_version_id_old is to specify what migration version is needed
> for the code in the function pointed to by load_state_old to be able
> to handle it on incoming migration.)
>
> We have exactly one VMSD which still has a load_state_old,
> in the PPC CPU; every other VMSD which sets minimum_version_id_old
> is doing so unnecessarily. Delete all the unnecessary ones.
>
> Commit created with:
>   sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
> with the one legitimate use then hand-edited back in.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

queued.


