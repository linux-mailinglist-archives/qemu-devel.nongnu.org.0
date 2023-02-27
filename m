Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C796A4C14
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 21:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjs3-00084Q-7r; Mon, 27 Feb 2023 15:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWjru-000812-9k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWjrs-0004AP-Dd
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 15:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677528783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
 b=Kws9rq09P+YSfzVp73AkpTFiq4tmNe4v22FdWka3Tr1t1q2k5CQsa5FEjoCzizneaNr8v6
 hOqAT2iqs1GkLj3UemvYj2YzVZdoP+ay4ZQRtvfg+MWa8OmsoTIjmJ4iXQ74UAqTew9ySB
 447mI94nhCCWSfyvnwDLManUVpqcyAs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-IfO8tSU2OC-tgDxVCauDuA-1; Mon, 27 Feb 2023 15:13:01 -0500
X-MC-Unique: IfO8tSU2OC-tgDxVCauDuA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d24-20020a056402401800b004b65da6d5e2so4670935eda.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 12:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nXo6S0IXEpM+6py6VQyWASTHuOuAAX4yGyZNHQtCjPw=;
 b=amFO61Zr2PAHhQ+3qM7JEf14/mqRAJob5zlq3ozOa+RmGEQOxcM9JgIdKwFJwmRUVH
 SxF39rOXmb6cBOjYM4TAClvQb2LFwZUAwycS16BH12WUMImHo7MhXqWPI/NoWd5IogIt
 85o1jL9H/oPiPnAOF7Y1rXKeEZzf63bJ8R4cOATltqxp4S3FWcEY3EH2Hv4zeBm1p1lb
 FXedfI+AazegjR9ol0TeXIfbYnIDeaX4EPpePOI9SbJBQHmPwzp3H5da5LxliRHOkKOu
 8/4SCHbw6S9XG+fi9Nmsfp+h/ZiDjikayJQPYTAXa8IHKUekU9lYxh5RJWE3crjwX8dX
 T0CQ==
X-Gm-Message-State: AO0yUKUKADdRMbP1EJlCdN80lFCN9poCTzL6gAtEFGgAqqaRPpVrSlBU
 b7aOsyMH/JIr0RXd1izWlJjm0DbYX6UYqjcJNPLfwh/53uTjbKbni6SzNQr1Ymaoxv6WZ3CP7cp
 cTaPUUckbYxgGy6s=
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id
 d25-20020aa7d5d9000000b004aaa1d4bbd4mr795777eds.42.1677528780644; 
 Mon, 27 Feb 2023 12:13:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/s65ko7k8eMliaBLSgcdKtqsDe7q45PYpAz8p7fZUIE9CJak+If2OjVIOVHy1F3DAavKzVwg==
X-Received: by 2002:aa7:d5d9:0:b0:4aa:a1d4:bbd4 with SMTP id
 d25-20020aa7d5d9000000b004aaa1d4bbd4mr795759eds.42.1677528780354; 
 Mon, 27 Feb 2023 12:13:00 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v29-20020a50a45d000000b004af70dcce7esm3516370edb.40.2023.02.27.12.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 12:12:59 -0800 (PST)
Date: Mon, 27 Feb 2023 15:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230227150858-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/yY72L9wyjuv3Yz@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> I feel like we should have separate deprecation entries for the
> i686 host support, and for qemu-system-i386 emulator binary, as
> although they're related they are independant features with
> differing impact. eg removing qemu-system-i386 affects all
> host architectures, not merely 32-bit x86 host, so I think we
> can explain the impact more clearly if we separate them.

Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
a superset.

Removing support for building on 32 bit systems seems like a pity - it's
one of a small number of ways to run 64 bit binaries on 32 bit systems,
and the maintainance overhead is quite small.

In fact, keeping this support around forces correct use of
posix APIs such as e.g. PRIx64 which makes the code base
more future-proof.

-- 
MST


