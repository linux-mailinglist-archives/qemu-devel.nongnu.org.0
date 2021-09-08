Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F80403D97
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:29:55 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0SQ-0001lt-Ma
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mO0Qo-00015I-Az
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mO0Qm-0001sp-8y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631118490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5cKzBL064rqHXv1WjSrMuuTOzSBbrLmVn193Aaw+Es=;
 b=PMPpwukAydqsaQZM4VYV46v4dT9Cp1sAjfrA1Yq2YB7140YqwNnpc50krGwxMbjD3TPEk8
 TRGIqD0Q7tuDWdrIYtsB2BBRuMKTT613748XhacacBo9LcDar4ZYHikpGLGv4ogxIB3R+Z
 T8zfYo+xEEgX9YNPmDe8wrq1Oayj0Jw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-XOX_BQfjOU2tPnblqaDhHA-1; Wed, 08 Sep 2021 12:28:07 -0400
X-MC-Unique: XOX_BQfjOU2tPnblqaDhHA-1
Received: by mail-ed1-f72.google.com with SMTP id
 b6-20020aa7c6c6000000b003c2b5b2ddf8so1403066eds.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p5cKzBL064rqHXv1WjSrMuuTOzSBbrLmVn193Aaw+Es=;
 b=hGKDtXrLl7EuPLgWmUclWx25pAr6OtsJKUyxqT3dgnfdemJKBXUFbHkCHYnWJQk+p1
 4TQQIsUdxax1CXyzwszk0RHn5PKMbm6qOqU87GVSk1Yl5xo7sXqawYLqeYrXKEQuAt6W
 ufsjwCRlKRu0DN/AqdsGPVsC0gRQT7ac4GlJE6+0SS0sQXMY/BZHA2wLW0Pb+Qjb0E9Z
 b7itgCi8GrtTbB/l75MNNCvZFxLkLPYMv4oA1Cm6j3HXB15YdGKrE32unYYnM1MuYR61
 MBjUr2/3rO7bNSX9fyXh0OnkhLUMM7qhXe+qAy9KJh/p7teBpJJ7Eka+cvTuc4lW+4c3
 0x2w==
X-Gm-Message-State: AOAM5323jwjX8UMY7kgH581HpC3mCelUhk4eVtNGJV0wcT/b3+GeqAOg
 sH2a1QCOMPTGoN/a1rcaBw8VrvENniZvelQdEImkWcaysiOXv1UgF82hfweYuZxkmivZBx3N6Fr
 W90/skfhhUYRPbTY=
X-Received: by 2002:a17:906:43d2:: with SMTP id
 j18mr677012ejn.363.1631118486449; 
 Wed, 08 Sep 2021 09:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK+sse1uCde7pWT+xKr05NqAWSdTLhRidD8bFzV/N/s7LQ8kSoDgEL2Tb6dg/rKQ9dgz16CQ==
X-Received: by 2002:a17:906:43d2:: with SMTP id
 j18mr676990ejn.363.1631118486218; 
 Wed, 08 Sep 2021 09:28:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r11sm1302897ejy.71.2021.09.08.09.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:28:05 -0700 (PDT)
Subject: Re: Compatibility between -device sga and -machine graphics=off
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <YTjf6BhpPU3aLct9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <364031a0-982d-f6bd-cbcc-9f6d9be4ba69@redhat.com>
Date: Wed, 8 Sep 2021 18:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTjf6BhpPU3aLct9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 18:08, Daniel P. Berrangé wrote:
> Despite this difference, I was able migrate from a x86 guest using SGA
> to a guest using graphics=off without errors being reported. So it
> doesn't seem to change the migration data sections sent on the wire
> at least.

It would probably break with Windows XP/2003 guests on AMD processors, 
as those are the ones that use kvmvapic.  On other guests and 
processors, it's a no-op.

Paolo


