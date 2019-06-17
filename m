Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E216D48A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:30:29 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvSe-0007PB-FW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hcvQ0-0005xj-Do
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:27:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hcvPz-0002HW-Bd
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:27:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hcvPw-0002AT-Lr
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:27:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so10836251wru.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 10:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pq0P8AJnEDOv20EBlAclpgixfJWfuJ/yJ3E9B6wWd7U=;
 b=gFYNg7Zfj06VwOB+xbW4ETpvVqzy3VqsmZbK5PFWIY6/VT1iSTFNvYipxdr2wuuUyP
 VblrRZ0KPe0gKFd3Gs3SoBMcL+wYiMkrAm/7dox9AujUuw04ANa1Dr/SCixRL/VlLOvm
 pil7tF8YTaiKSIc9AhJaKzaa0KXeA+JGp9KjgKmtX7+JD9K5N+WtRCcqYa1vrGVPNC82
 FFPzfHjiRaVXXJy7M3NVow6XMnYkKcES8G37MGex1yD/AkkilZJCWKJeshYGKjCq86PC
 jf9q2uxAgGn6K/A16bU+4azFZEih6au7JEwylCPennTnpumGB3Sl/AtPqo112TIV6XxI
 FI+w==
X-Gm-Message-State: APjAAAX7qGBeqLAWrwQ9Yt/X5e2ipVk0aUMLaaJY6fW9PHf4Vso118js
 KOjpGQuiZZOqJXPp2VOvIahBIA==
X-Google-Smtp-Source: APXvYqzHbhmHIjlX/6hx8s2K6JsfobTJYgnlyasFgv5VRijasbr+OB8xVDqJOtlFA4duQEznCbD2rw==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr8023610wrs.74.1560792456854; 
 Mon, 17 Jun 2019 10:27:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:51c0:d03f:68e:1f6d?
 ([2001:b07:6468:f312:51c0:d03f:68e:1f6d])
 by smtp.gmail.com with ESMTPSA id p3sm14332957wrd.47.2019.06.17.10.27.35
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:27:36 -0700 (PDT)
To: Liran Alon <liran.alon@oracle.com>
References: <20190615004256.16367-1-pbonzini@redhat.com>
 <20190615004256.16367-4-pbonzini@redhat.com>
 <EB7EDEC6-BD44-460E-B7B2-29060631E4FF@oracle.com>
 <0144E234-98F2-4D05-B2AB-8DA23E418D46@oracle.com>
 <74FC0FAA-54DE-4E72-90F5-32B0551F1D83@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c281bf78-2753-effb-fb23-31600e272723@redhat.com>
Date: Mon, 17 Jun 2019 19:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <74FC0FAA-54DE-4E72-90F5-32B0551F1D83@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH 3/7] KVM: i386: Add support for
 KVM_CAP_EXCEPTION_PAYLOAD
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
Cc: Maran Wilson <maran.wilson@oracle.com>, qemu-devel@nongnu.org,
 Nikita Leshenko <nikita.leshchenko@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/19 13:34, Liran Alon wrote:
> Putting this all together, in case kernel doesn’t support extracting
> nested-state, there is no decent way to know if guest is running
> nested-virtualization. Which means that in theory we always need to
> fail migration in case kernel doesn’t support KVM_CAP_NESTED_STATE or
> KVM_CAP_EXCEPTION_PAYLOAD and vCPU is exposed with VMX/SVM
> capability.

For VMX this would be okay because we had a blocker before this series,
and this wouldn't be any worse.

For SVM we can ignore the case and fix it when we have
KVM_CAP_NESTED_STATE, as again that wouldn't be any worse.

Paolo

> I can condition this behaviour with a flag that can be manipulated
> using QMP to allow user to indicate it wishes to migrate guest anyway
> in this case. This however bring me back to the entire discussion I
> had with Dr. David Alan Gilbert on migration backwards compatibility
> in general and the fact that I believe we should have a generic QMP
> command which allows to provide list of VMState subsections that can
> be ignored in migration… See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg622274.html
> 
> Paolo, What are your thoughts on how I would proceed with this?


