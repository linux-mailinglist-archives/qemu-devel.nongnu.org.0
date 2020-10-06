Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF4284C08
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 14:54:03 +0200 (CEST)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPmTi-0007xQ-G4
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 08:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPmRk-0006gh-I7
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPmRh-0001GS-PQ
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601988717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GyxQa03IhAv5hgAOKqlP02mxq3ZBfl4/njdmgh/It0=;
 b=f7H1x3F1HTtDTYLJyh4uAbbwia5BZ3OSGc8piHni8yGlctg1ZKUvQH9NAEMDH5WGXdFYoJ
 jJd6C7qB5wnWrDbtHgtgcBqPkEgioEv1gFlButDRt68KFvpNw7vHY21HzV1qTG4+9uuIm6
 f6xyzO/D9vy5IYNhBctHsEin0i4iFUQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-YWtJuPpmM--vocKvJ_H0tQ-1; Tue, 06 Oct 2020 08:51:55 -0400
X-MC-Unique: YWtJuPpmM--vocKvJ_H0tQ-1
Received: by mail-wm1-f71.google.com with SMTP id 13so1088469wmf.0
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GyxQa03IhAv5hgAOKqlP02mxq3ZBfl4/njdmgh/It0=;
 b=p6UD4TsTcIxri0SCQGjRnBZLK9XdnqL0vNbaeGRNiOvCL3VDcyncMg83wV/HC/yUcp
 iuxqTuAJwMHsFcKT+y/oyPYm/wVWtvQPLYbXZm4DvG5B6ybcSHZXQGssSBHarutrqpLc
 5EyAUThYb39FKv9JGtVsK+dlgxDaFhb2BpaRi/zosrkfF8Zph/YU9h7i+AYYe/ssj4Zq
 hlCNFwlyYKzTfKFP9LDW30MIRE3xCHXF55uKxKbNI1grCUQ3L0Xy2u0pZa5tKD28tGFJ
 53w/QmlaotPMD07NQB5qPXaraeJIM38oJvz+3HgmlX9t98e98xmiS5FcQazocBfacve1
 jStg==
X-Gm-Message-State: AOAM531/FzSsfvL8eBMhtiKqxY0qbcZSbR5TI+FDmcN7R1dS17YbnR3Q
 +NF8RnjsiOK6lDs6wh/72jbq1SKkVfwVMVpxFr7Yo+KP17U4Vf4rw1ZogzDFdkNX9pd6UVs7geF
 /w6wfZez7nKen1Xo=
X-Received: by 2002:adf:f207:: with SMTP id p7mr5196818wro.152.1601988714478; 
 Tue, 06 Oct 2020 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX060biAYE10YhUSdyRXXm5syrQGIE+ycF/1slmhbF+TTibNs8kYbCZsCXTcltbw8bLYdZpw==
X-Received: by 2002:adf:f207:: with SMTP id p7mr5196793wro.152.1601988714221; 
 Tue, 06 Oct 2020 05:51:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id c68sm3940098wmd.34.2020.10.06.05.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 05:51:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] hw/nvram: Always register
 FW_CFG_DATA_GENERATOR_INTERFACE
To: Kevin Wolf <kwolf@redhat.com>
References: <20201006111909.2302081-1-philmd@redhat.com>
 <20201006111909.2302081-2-philmd@redhat.com>
 <20201006121507.GE4202@linux.fritz.box>
 <c36178f9-67f1-2d22-6537-15c73516cbbe@redhat.com>
 <20201006123854.GF4202@linux.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <40b7c403-1ead-f320-c221-d2b4641112a6@redhat.com>
Date: Tue, 6 Oct 2020 14:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201006123854.GF4202@linux.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/20 14:38, Kevin Wolf wrote:
> Am 06.10.2020 um 14:20 hat Paolo Bonzini geschrieben:
>> It's
>>
>>   Based-on: <20201006111219.2300921-1-philmd@redhat.com>
>>
>> (which won't be applied in exactly that shape, but more or less it will
>> be the same).
> 
> Oh, I see. Then I guess it's not supposed to be merged through my tree.

As you prefer; feel free to take that one when Phil sends the final version.

Paolo


