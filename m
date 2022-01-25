Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A549B129
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:09:32 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIlX-0000Xt-Se
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCIen-0004Uv-Uq
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCIej-0001IS-Pr
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643104948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6wREBbju1p13XNT3jD/cQKk4DaPje1R5CCzSITiKBsU=;
 b=Y2EZJdkMbJNkXpRIVTbxRLfq8LIJ1aCkEaPmiQqR/cs81brybmnPeMm7aYiPQSpLJiy35U
 4C7ytcR520UNRBnXt+CMxQQ6p8yZ6UYojiJ5j5xvlvEA9O1TwywEDW+uJvAmCvieqtMDuG
 4lo68wWOLTNNnV5HBggur0Z4ATlCdZk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-SOfeTJcsPWS4Xt2cB0IJqA-1; Tue, 25 Jan 2022 05:02:26 -0500
X-MC-Unique: SOfeTJcsPWS4Xt2cB0IJqA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r27-20020adfb1db000000b001d7567e33baso2800413wra.12
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=6wREBbju1p13XNT3jD/cQKk4DaPje1R5CCzSITiKBsU=;
 b=x7T9Dfmp7BuB5IR+gLc6bNivrR5fUrgdRQYQaH4pPQvCtRSqYUxT2Gy6yT6BiW5atq
 YElObBfnVNVoFKEpQVRc1nV0LKZDHaB2zPHW3Dq6qpZeki9HjbYa1BxpkBulUVlqI2+F
 Nm2arnlkquEH2An5ufpa+LrqD9bJCmGs6oMPBc/FotMtZXdt4IwgrRDE1Jc74ygu5+dM
 +14n3TTWQfhjAw29BqdGIT1tfP0ZFcXavcfLzWX+OBPYLsrp+zdJHWCOhSIS+yJ+4EKM
 tH5WoBlqiQWDK811c8SNb4VoCEr/E0+M2PrlNa/tZ1SZFYN2NgilmbWVa/zoVGgKHVKR
 fC1Q==
X-Gm-Message-State: AOAM532iZy8Z1NCQd0cHfUQKoIVZvck7izbYYus+LbOmZYPRW10F5Rxz
 bu7JM18ww0I/aHvgbDcHwQ6lt2OE4eNNYqeIaoPon1F6T70Cv1UDq8RfEx1hA7NvP6HHqubfUHK
 noFzUoqettlMUsJo=
X-Received: by 2002:adf:e184:: with SMTP id az4mr6133111wrb.491.1643104945625; 
 Tue, 25 Jan 2022 02:02:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDuZ5AImgdV6yjNv76TcnSvWeOpvcwtIaj1y70suMtEheLAxKZjzqwsOiqHQcdzCw7SEnzSQ==
X-Received: by 2002:adf:e184:: with SMTP id az4mr6133091wrb.491.1643104945438; 
 Tue, 25 Jan 2022 02:02:25 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id o10sm2620942wri.19.2022.01.25.02.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:02:25 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 23/23] migration: Export ram_release_page()
In-Reply-To: <YeccvnAuP6I9TL3G@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Jan 2022 20:02:06 +0000")
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-24-quintela@redhat.com>
 <YeccvnAuP6I9TL3G@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 11:02:24 +0100
Message-ID: <878rv4rv4f.fsf@secure.mitica>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Erm, why?
>
> Dave
>

I messed up.

We need to call this function on multifd.c for zero pages.  But the code
that I sent don't have it.  Will resend right now.

Later, Juan.


