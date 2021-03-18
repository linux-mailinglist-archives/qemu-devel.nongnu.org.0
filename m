Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B43340377
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:37:14 +0100 (CET)
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMq1h-0004Jb-9H
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMq0T-0003WN-SN
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMq0M-0008Hk-EZ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616063748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTZQ+7XUEzLyAaYvaVMo0tiQqIcBJ6b4Zim+QOF6T7M=;
 b=NYN0WZVp3OCP8qhU98B1bMF41XabEA23CSajYJCxZ3GxaMu0G1JhLgSwO74iEC7dT/ArrL
 SLjEpOqW21UClPSRbIdq7fwTyU3VHIMpkuiMZC4QTDP2EZxbapgYySSCcrKTILtjd6ohkg
 Q5mA+haLEWso1uo5t+sd7a/I2ZvJqHw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-DxjFczeQNuO0ZAgbgH6OYA-1; Thu, 18 Mar 2021 06:35:46 -0400
X-MC-Unique: DxjFczeQNuO0ZAgbgH6OYA-1
Received: by mail-ed1-f71.google.com with SMTP id i6so21058876edq.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hTZQ+7XUEzLyAaYvaVMo0tiQqIcBJ6b4Zim+QOF6T7M=;
 b=H0BM0e9CgskNkCtXO8YPRJ5iMWmA0CjN28MbnB7TUmpIiBc0n9e2vnQ/UO4RySoVy8
 SHqjnCtMrGBCmjhB/77OyQp9Jd1rDb18kfSKzDDPt+UodEaqYwdHZKi5f/ULTi6g2Wjp
 rrFVZPNgFy9rm12Bx/JTyd4b+rHXsWaZIUKCSse3N3fKW0baDMxdoeIuxH/2X1YYO8LJ
 ksgRB1RTFQShgBXnwgquxjw6IoYg9u+qjCDJurOrWeGQYmy+o7AxFKHJZB64g7IOTAi0
 TQFkEWaHVhO6LdGULveIPvOHQSbG+eFtM9r4t/1xYJ2XgaEf13qE4eWbz/XpNcGNxYdx
 CKJA==
X-Gm-Message-State: AOAM532Ms9fnk+/3UPQWSMJcLqJU6MdNPr/jAsnkCOrhTVrjSnblGjzh
 lrX4hL4HowoUPtJucczwYIvGCQmTi2K8azVz0XanPzLQV2f2Ir5WTLiE7uPKyZzd65zJt7iDEgD
 ougdKX9vqU4aSAOs=
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr2777223edb.304.1616063745651; 
 Thu, 18 Mar 2021 03:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeoCHYYgLPLj4URHCW02WfE39kHeL6gqTVcqcVxhvMSWmTbG/8hNFQyvlsTOpVpRvtGS9MOQ==
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr2777207edb.304.1616063745513; 
 Thu, 18 Mar 2021 03:35:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u13sm1528360ejn.59.2021.03.18.03.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:35:44 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
Date: Thu, 18 Mar 2021 11:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 11:06, Laurent Vivier wrote:
> This also removes the virtio-devices test, I think we should keep the
> files, but in the files to disable the PCI part when it is not
> available.

I think we should just shuffle the targets in the gitlab YAML to bypass 
the issue.

Paolo


