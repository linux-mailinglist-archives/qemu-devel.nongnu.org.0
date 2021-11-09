Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CF44A7E4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:52:12 +0100 (CET)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLvP-000141-1w
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:52:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLrx-0005d2-0l
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mkLrr-000055-IM
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636444110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UCCUb6vCYFJD0gx4VmuTHbuai9qJ9t/EfbVq5YJUEpQ=;
 b=gLu3hAddU4bbTmz04zpfBkL0/EKUMVtCa37WfjST+wi+Sab/70zh6FEhIArS55V9rzfrgz
 2x0HH9xKvxdrucSpg0Musvbm8DSQLhMFVGv7BZwBiCMivpK9R5B85t1QyWES+x0w7cNH7W
 0ND9WdQICK3pxHE5vekFOu1ygR0So58=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-vFCZXXYWN52quEFK8XjauQ-1; Tue, 09 Nov 2021 02:48:26 -0500
X-MC-Unique: vFCZXXYWN52quEFK8XjauQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso4599891wrj.12
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UCCUb6vCYFJD0gx4VmuTHbuai9qJ9t/EfbVq5YJUEpQ=;
 b=vc/dWnp/+yl/iXbEZfMxFvuOOn8eg7VFeF5gOszsRdB6qrO+itPs15MXIRHvoQ2vPb
 IiFJfXU+pi8HHUnjVCdNFLV1yqdlOWLZEIR5afsEmoKchkdzwJrPa7JinoEu2L+PBS/9
 4lomfVpTmXf5JFCeY9GLv79CcDERnavUJcia7NksJgFJVy/4bdYEXo5IqSV/bcb6nPPa
 7Nvi+oK6udvJ5Rtnx5QKfXDnaNkJehLzvTz4CQVNEZwlF5/62/iiWfzNPDuSINEAVd8X
 kjcYKZXjHupPQsf8fLDzvxDbRReJMen0jDbgGBu2/z5mZ/IS5RsCSusxW9xXYv9nJ1mm
 FZhQ==
X-Gm-Message-State: AOAM5320l3Hi2HZrfjX/nf7YChacVzbwc6xErWDOm7blBARtHhi6YOY1
 7tLrxhtO9g5cmzWfFKjUT/DOC4N3ToMWQBC6HjAHMlO6XerTB4zEQYtBvO0poTieHTAQbfUQe/H
 AqH74IN8Mzw6fM8o=
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr6783857wri.322.1636444105003; 
 Mon, 08 Nov 2021 23:48:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFAHL98mIA9WKQYn9NFAFDLLmEBmFSOJwNLr3zrS+j5a2aBxNRB8YeOQ3+IwVSnsD7US3CvA==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr6783832wri.322.1636444104770; 
 Mon, 08 Nov 2021 23:48:24 -0800 (PST)
Received: from localhost ([178.139.230.94])
 by smtp.gmail.com with ESMTPSA id t11sm18933591wrz.97.2021.11.08.23.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 23:48:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v7 1/2] Reset the auto-converge counter at every
 checkpoint.
In-Reply-To: <1636427095-11739-2-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Tue, 9 Nov 2021 11:04:54 +0800")
References: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
 <1636427095-11739-2-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 09 Nov 2021 08:48:25 +0100
Message-ID: <8735o5g46u.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, lukasstraub2@web.de,
 zhang.zhanghailiang@huawei.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> if we don't reset the auto-converge counter,
> it will continue to run with COLO running,
> and eventually the system will hang due to the
> CPU throttle reaching DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


