Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B959259EE1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 20:59:53 +0200 (CEST)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDBVY-0005gd-1i
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 14:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDBDS-0005am-6k
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 14:41:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDBDP-0000b8-T5
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 14:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598985666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHnibG0oY+2YPBeaoqJM72SJmM+iyP39BF0RO3DNpvE=;
 b=AERScBusxgZQq7AoRIzaDTVIMn/JSb0yE6/MGZdO5wEXF4GceeuKejcc0uyeLTNtLlGs9K
 8dv9IrxsJbr+EuXJsKFLK8B8X6ks5fifRN0LVeqdjuHYTQdEIsT+N0LtsCASiTmKFPzZa+
 UowjgKIc14NEE01y9OkL3+LEgUjtmLw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-S0kuQMTOMuuk8sTy0wUrcA-1; Tue, 01 Sep 2020 14:41:01 -0400
X-MC-Unique: S0kuQMTOMuuk8sTy0wUrcA-1
Received: by mail-wr1-f72.google.com with SMTP id v12so916176wrm.9
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 11:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cHnibG0oY+2YPBeaoqJM72SJmM+iyP39BF0RO3DNpvE=;
 b=erzzS5bpkjeb915N3ejp5KkIKhTAi2dc2w81iE/06TvHsA/o9J9rAGGeflh4BaZfoG
 yNLi3nVZaFx6lVKXP9J3MPTYzTg7395JSuiwopSkWP3viwHzJgffp6sa/5OzTZwxx5rM
 vLWUkoxrYf908Id/t/HXFkUpyeqtFPzsR7QJ2mrh75ky11KiTRA9rKHkH/8Gm8+roozq
 YEQi59++Sn6TIGuK+06tjrrjD73Lvkc/Qd65cbLhOMBTBW0ITXMI8yfX865Wf7g7tW9/
 vYMaXbqhiEI7dDZAbh8fHYpp/22PCXVcRt2msBoaL93M/QFi/PIY9qBLvsdYAgLmpFSV
 fvKw==
X-Gm-Message-State: AOAM532vk/aCHTgv9U347CuxH6j5E+ogGOdPs0Pz/KgNCSXxs1jv5ndJ
 mr57oSeUCtBAsuk279aAuMmUQXy63E+KUrmo+XsHXVb94wns2szXWLPj3jqnAAkNW1yuy2UGHWv
 R8EqUgw2ewYQVF8o=
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr3182446wma.100.1598985660318; 
 Tue, 01 Sep 2020 11:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB2uUsmAMGlkSZcr01tWWvyyS7Sc9/A2dqh30tGZQK7k3UNVNKiyOHP4wLqFuI1nJPJbqe9g==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr3182430wma.100.1598985660129; 
 Tue, 01 Sep 2020 11:41:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7fbd:8007:1fa7:ed17?
 ([2001:b07:6468:f312:7fbd:8007:1fa7:ed17])
 by smtp.gmail.com with ESMTPSA id l9sm2857616wmh.1.2020.09.01.11.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 11:40:59 -0700 (PDT)
Subject: Re: [PATCH 03/13] oslib-posix: default exec_dir to bindir
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200901062020.26660-1-pbonzini@redhat.com>
 <20200901062020.26660-4-pbonzini@redhat.com>
 <b922b8e3-4ba0-f035-014e-c77df254d6de@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0a52a88-25c1-9d18-6ab5-10dc86c989f7@redhat.com>
Date: Tue, 1 Sep 2020 20:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b922b8e3-4ba0-f035-014e-c77df254d6de@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/20 20:04, Richard Henderson wrote:
> On 8/31/20 11:20 PM, Paolo Bonzini wrote:
>> +        exec_dir = g_strdup(CONFIG_BINDIR);
> 
> Why the strdup?  The string constant should be fine, IIUC.

Of course it is.

Paolo


