Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF7680552
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:01:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMIA-0000fb-So; Mon, 30 Jan 2023 00:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMI7-0000eh-Kw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMI5-0008NO-SI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054872;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kPbxwB4lztjddg1j2DSDcG8v9RU4zJGqgHH2ks5z9EE=;
 b=gbLQ8SPhggnV753OnZ/QzTUQnBpfP+tcNixh/VBHei9NtB+ip4KNDU7RK6xAH4iVyNhPTe
 HnOCwtq9EWx9CMh/gD8uHz/M+YEiG3mfiqct0tItTeuHZyu9oKldRh6ll8gIl7euxe1AeO
 5ktdPuIVBsonxvxBt+Jfqc55yCMvyQE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-JZ22zOSeOk6BQeh2cV-L4Q-1; Mon, 30 Jan 2023 00:01:09 -0500
X-MC-Unique: JZ22zOSeOk6BQeh2cV-L4Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r6-20020adff106000000b002bfe5fb9649so490263wro.14
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPbxwB4lztjddg1j2DSDcG8v9RU4zJGqgHH2ks5z9EE=;
 b=KRHLXJh0CoJxGFxRB8VRPMWXO/JzjGEggOmRFqqzO+RoA+lHL1B9ksREaZdRp4OUq8
 sIc+8KZ27Y+uP7lcBk0Tt0l7+mDmdYbTeKZeK4/9NoTz5Yy3OpQ1ZvSKXoEniImQELTI
 qzyTp5RF3ZsOc1qFaUtmG0Nzh/iLQnATwnSzfRjeUC8LPxLUl7CYkrA5K378VC0TpuH4
 q9lXH0oxK++pmbeeiNAS1YG3INN0HHEtuVMgHlqmkMPwNRNlu8e1Jq9GpCQUClhUvxwB
 XgK5DhdfpPz4Qo7TJINdqjwm+fxshdcM2kAeTQZ6QLk0a2nBX7TsjijJoMAx8cN3xfom
 ycRQ==
X-Gm-Message-State: AFqh2koD458brXViCJ6ksnsCGkk/yVTZ2OBgP5o7RwAzDvjPucmwoBn9
 HWYPWXsWZmBdq5Z/EvMTd4svG6fPsZTuKt7dUoFETVD7rjmWHaO08IqlVFakZ+KFeySVD7v1suU
 N1YXqESTJHxoR4UQ=
X-Received: by 2002:a05:600c:c07:b0:3da:ff60:f5c9 with SMTP id
 fm7-20020a05600c0c0700b003daff60f5c9mr47298844wmb.40.1675054868472; 
 Sun, 29 Jan 2023 21:01:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUQQPs87S7wwHehz6ud2T4CztfjEttqJ/e24qzydMHYwVUqLQ3Bo+NKWBwwRFpsMn40uYRXQ==
X-Received: by 2002:a05:600c:c07:b0:3da:ff60:f5c9 with SMTP id
 fm7-20020a05600c0c0700b003daff60f5c9mr47298829wmb.40.1675054868262; 
 Sun, 29 Jan 2023 21:01:08 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t19-20020a1c7713000000b003dc48a2f997sm6175729wmi.17.2023.01.29.21.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:01:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 04/21] madvise: Include linux/mman.h under
 linux-headers/
In-Reply-To: <20230117220914.2062125-5-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:08:57 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:01:07 +0100
Message-ID: <87pmawk44s.fsf@secure.mitica>
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
> This will allow qemu/madvise.h to always include linux/mman.h under the
> linux-headers/.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


