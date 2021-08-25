Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF93D3F77FC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:06:49 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIuUF-0004ZG-9S
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuTI-0003st-7e
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuTC-0007rH-Pk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629903937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=aGkdPp4VU5quoF8/SE2WRq1aH0HMe2XHWNFmBc4CM9Y=;
 b=cM/OBFU8lsXjY3dsgh57QUTpBxqQmw/4XKGthYgcIGof+i7mHR9W4b/q9hMNP+1YEU6sK2
 xmQvGO/DE9/WBIdMJCb+iD9qgLFLXDBeDFx5GlNGdrOZU25WfTDSy0IKWCa4AYbwOI5nNU
 XGm8ZJ9gGPU/Y7tYwkgKBZiUkqxIyCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-I6qwz3vhOgi6A7nY03-VIw-1; Wed, 25 Aug 2021 11:05:33 -0400
X-MC-Unique: I6qwz3vhOgi6A7nY03-VIw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so1936417wmq.8
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 08:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=aGkdPp4VU5quoF8/SE2WRq1aH0HMe2XHWNFmBc4CM9Y=;
 b=YkP5+UwvsSv8Gn1hUeApl6hdZFsYHxwD9GMmgDO0zfZumN3OSioIjgeKB+RROomrOq
 ddXYGR7Vd1WgdWxkSNEpNr7H1fCYUOVxhfFtFrkGI+cNWEBayln9BLKVHIFhrgCKNvqc
 LA0MCLIcfZmcIRcctCXhnAWWsjAHdYXxznnEINSEXSfMzWAXNBlov0Ke7oZNJZXGtpdS
 hz0HhocoINdYIkKM4uLb6cavXp3xQRWmK9TzKAmHCd31uAo1rgRt84cgzXvosjHxukRG
 fao+c7M9TAqeFAA3nfLoWFqwOO0+NBx9M04R8ivs2roZ1sQMVDY6w2ukRKXyspyCQ8n1
 PnOw==
X-Gm-Message-State: AOAM533D6s3xZUL1qxX77MX4/Lw4MRnQySFJGathJupaZyt3dGK/Q+lz
 jg8CNUI5DlBDX5a3mjKkc6JnEjUtZtGmySCeO1q2rY8Vb9r/PM3R9fs69O2hP1vcLWNct/pl5DC
 MR/vfSYbU6zQAlac=
X-Received: by 2002:adf:ba01:: with SMTP id o1mr26211491wrg.419.1629903932527; 
 Wed, 25 Aug 2021 08:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSjtKsLwFlGU5tqUYnD/YV+hubOefwyg5kSbBTf7ze6tNoiQlkIRZkkNxstuwZWJB8f8qF7Q==
X-Received: by 2002:adf:ba01:: with SMTP id o1mr26211472wrg.419.1629903932314; 
 Wed, 25 Aug 2021 08:05:32 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id u5sm114773wrr.94.2021.08.25.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 08:05:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v2 1/8] qdev: add an Error parameter to the
 DeviceListener hide_device() function
In-Reply-To: <20210820142002.152994-2-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 20 Aug 2021 16:19:55 +0200")
References: <20210820142002.152994-1-lvivier@redhat.com>
 <20210820142002.152994-2-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 25 Aug 2021 17:05:30 +0200
Message-ID: <87r1eh4lad.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
D> This allows an error to be reported to the caller of qdev_device_add()
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


