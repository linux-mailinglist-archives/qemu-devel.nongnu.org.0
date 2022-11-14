Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7F628E46
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinO-0007ag-MC; Mon, 14 Nov 2022 18:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif5-0001zn-UK
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oubEt-0002Vj-8W
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668439150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fOl5xPvxZtrP/mt43b0cu9RGe4mHY5j3f37onR/BvkM=;
 b=Y25mBzPz1jd/B/xtN29PzMqP+msMpnhzAss9lePt86yo4i4FpVRRD2lCuzXSqC7UpgUqf7
 3GoVFQRlsO/S9vqYdK2oG2Cq6+o6N9ALd2ih220vMRdHjWjDzXx4azQ6X22XmWTJiwmWGe
 aOv79edM2jBkXe8JlsspNwvNp6uk8HY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-uh0wEUQQOOOTF_JR-Fp6Fg-1; Mon, 14 Nov 2022 10:19:09 -0500
X-MC-Unique: uh0wEUQQOOOTF_JR-Fp6Fg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso2081678wrd.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOl5xPvxZtrP/mt43b0cu9RGe4mHY5j3f37onR/BvkM=;
 b=fdfhPO5/fUbVh855dSp6H6RMk3gn8tzALJqlzbGF5G9VNsIZ+W73ikRbjkqzO/lTto
 D5X4uLeHyYxcoc0DpCD7xt50sBUIzlU1rUTZi9c8OnWhRDTWSCw9snY9qBXC1RzSqBKm
 9EgehE7f1PMNRkjtcKQ3eJrqT7xYlo5jRBzJNrmoVN44ySz00gBfeA5MO44/BdINbZQh
 +3jKIXsCQbvPwsnIlpDJJbyORZFnfVRbNEf6muhpg13j7TbuTbRDOnb+Jwry1MuySHxz
 zHwqaqvE8Q+6Xgppt7Zk+c3hgODFlcoyuVlbZNqyBs7mIi9jPG00w2zyCSyfOK9j4H7T
 fWrw==
X-Gm-Message-State: ANoB5pm32GaHbOWATGgkgJH4vyA4NZdkz7UjtYf3Ufn40vxcSgPZs7M4
 T3fr7rGgNMGBkcJlHmMPcJYK3lbyHNLQshCRiTgPKlkdpBqaQbJ7Pm/i/4LwYp6m41z87LR6AmT
 aE36Sxphj0Vz8ocw=
X-Received: by 2002:a7b:cb5a:0:b0:3cf:4d12:1b4b with SMTP id
 v26-20020a7bcb5a000000b003cf4d121b4bmr8096099wmj.23.1668439148039; 
 Mon, 14 Nov 2022 07:19:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf56qipcvzUMsCl+90NMS+W4e+Kn32z0+2vGgFvHaFw+X+ypDuWhiE9q/dvtYpq4Ok+7cvo1Hw==
X-Received: by 2002:a7b:cb5a:0:b0:3cf:4d12:1b4b with SMTP id
 v26-20020a7bcb5a000000b003cf4d121b4bmr8096080wmj.23.1668439147802; 
 Mon, 14 Nov 2022 07:19:07 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003b4fdbb6319sm19008606wmq.21.2022.11.14.07.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:19:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 14/15] migration: Remove old preempt code around
 state maintainance
In-Reply-To: <20221011215559.602584-15-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:58 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-15-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:19:06 +0100
Message-ID: <87h6z1a7it.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> With the new code to send pages in rp-return thread, there's little help to
> keep lots of the old code on maintaining the preempt state in migration
> thread, because the new way should always be faster..
>
> Then if we'll always send pages in the rp-return thread anyway, we don't
> need those logic to maintain preempt state anymore because now we serialize
> things using the mutex directly instead of using those fields.
>
> It's very unfortunate to have those code for a short period, but that's
> still one intermediate step that we noticed the next bottleneck on the
> migration thread.  Now what we can do best is to drop unnecessary code as
> long as the new code is stable to reduce the burden.  It's actually a good
> thing because the new "sending page in rp-return thread" model is (IMHO)
> even cleaner and with better performance.
>
> Remove the old code that was responsible for maintaining preempt states, at
> the meantime also remove x-postcopy-preempt-break-huge parameter because
> with concurrent sender threads we don't really need to break-huge anymore.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


