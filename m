Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FD2B6C74
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:02:03 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5Io-0000Q3-Rt
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5HI-0007qQ-MW
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf5HF-0006uO-DX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605636024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzOrvc8vn2pmzKg6hZ+nPoXsyiwfCWoR7yNysuQXaKA=;
 b=MuGvgtI/dZo/HN9FY3yXjbIQp94WOhpb4yDnaz35KxtOKMAohz+WrY02IuzDUFl6Nhw9ae
 KUk2JR+jh5s0saHzdhy9v/joQP+uz0U92OwBKye8d2mVIdJck0KUKFKclvHRBd1P5M1kSg
 u9QrG/J25+6qcZ6819wCCTEX7rOSCs0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-BIwvpdtrOkmCJN1IBX5otQ-1; Tue, 17 Nov 2020 13:00:23 -0500
X-MC-Unique: BIwvpdtrOkmCJN1IBX5otQ-1
Received: by mail-wm1-f69.google.com with SMTP id 3so2106997wms.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 10:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SzOrvc8vn2pmzKg6hZ+nPoXsyiwfCWoR7yNysuQXaKA=;
 b=YXdsAyO+o/Hs+fc46P5380Q4XgblXSY+K1jM9lq4UEzXw9nKZv1vI1Sd71miZVMZHu
 bpzmFL4l/je1gAbINUXeYcG+tl2VtefOrkecveeT9L8v1sFN80yzwri0sV3Vg3/CHXt3
 0eYvB/V8L+icTH7bRNhg1C9ltiKTdXTFPWrOUYD03BXU66S56sFLfmosihZ+dOCLYkX+
 rOG00Ts826ZyROKdFdvlCHgvjGPBKdjzZdDDajjhcjC7cD7PwECn3ih136Wo9TaLCOWS
 8O/9epBD6aYe4sNwiLhJLfx3v8WsHq0xAlSmUF/QuznPTcyFC8wfYu61Unul1jgIy1FT
 uT8Q==
X-Gm-Message-State: AOAM532SE8nyQL4O7Iiehc4Zl/8hm2eylD2SrjefjeI8GUjTU4hApg1v
 6rr7XjmtlJRc+eAxGqHE2Q2N/4ovZw0xhRiK/dFu48J8OxxgEBIQxBfIcZfzZJ/xBlcigm8arYl
 gtAAo2nZsPQXu+tg=
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr283541wmj.41.1605636017668;
 Tue, 17 Nov 2020 10:00:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9Qs2O/6GfMZPR/edv2yX5yEvUq2XggcvpdIYa6DwOjBZwjFGUFQSKtvwr4o4QzBsQHmAHnA==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr283523wmj.41.1605636017490;
 Tue, 17 Nov 2020 10:00:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w1sm4530009wmi.24.2020.11.17.10.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 10:00:16 -0800 (PST)
Subject: Re: [PATCH for-5.2? 1/2] authz-pam: Check that 'service' property is
 set
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201117163045.307451-1-kwolf@redhat.com>
 <20201117163045.307451-2-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4f9589e5-095f-b8c8-dcae-bd873da51248@redhat.com>
Date: Tue, 17 Nov 2020 19:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117163045.307451-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 5:30 PM, Kevin Wolf wrote:
> If the 'service' property is not set, we'll call pam_start() with a NULL
> pointer for the service name. This fails and leaves a message like this
> in the syslog:
> 
> qemu-storage-daemon[294015]: PAM pam_start: invalid argument: service == NULL
> 
> Make specifying the property mandatory and catch the error already
> during the creation of the object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  authz/pamacct.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


