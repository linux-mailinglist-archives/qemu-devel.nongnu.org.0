Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF823EF03
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 16:27:34 +0200 (CEST)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k43LK-0000lx-2U
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 10:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k43Kb-0000KW-Gf
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 10:26:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23057
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k43KZ-00055k-35
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 10:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596810406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS9n/2aW/6nUxgbMI26oO/vEjR+08xGMRCfbc+6xuM8=;
 b=JgaqN7k5ECCfG+shH5OYsMrtviwFmm0zqAju2282KFXDfjRSyl4TjKCrTacdurmyb2/DBA
 RapVZZ2J04Klv9i+uwE8mtbsfxA/YFZIj54AS5SyyLDqVSe+Yvcfe1f7zAugcdZ5mqsoZe
 jHzAGavw1xX8VT6vkfzIADMMe2yA0WA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-MDb2bEVSPuybV7jL0fGiXQ-1; Fri, 07 Aug 2020 10:26:44 -0400
X-MC-Unique: MDb2bEVSPuybV7jL0fGiXQ-1
Received: by mail-wm1-f69.google.com with SMTP id c184so3983786wme.1
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 07:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TS9n/2aW/6nUxgbMI26oO/vEjR+08xGMRCfbc+6xuM8=;
 b=dCGHaMKr9dV4iSbRq5WQqGIaTQkiLgUSQq4jeLFc56SvXNYRswzJuOYsOYeyoj1qBO
 WtNIbTK8CMHPYJlSQsnnmmZu+lcuybIMKsAlRZU8dx17ZlHMuCVD9uu01YgbX4q9s/JE
 jpa5ky2byc5CctsIZMj8pIl9u2joy2JWRcOmysqgd9agupqZYieP8IISx3GZ7IFBjjP2
 byim6aB2iPmRzCh5HH5XT6ku3zj65+waU4uQCF8FXpQk0jLzfHv0LP2ujJXS+1V5wX8X
 eCxuL1UH9NKTyKDUWX+LWneXkOOjAgWWV1fmcSOd18qf+a6zvb8GDGLxNhUxPj9Yc1YE
 J7/w==
X-Gm-Message-State: AOAM533tcj6ls1Whdve3ZqvXxumjCkBf3bGbZkL44QKmtFLf5dVkZBxh
 if5LjfPr7pId9PFnWHtM7wGn6dY7k3uFah9hC81wSOxNc/dftaQ/lptIqi1PZoJSzvzocZBsywJ
 M8eF1v84n7g/jrBo=
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr12856493wmh.89.1596810403064; 
 Fri, 07 Aug 2020 07:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze05A71x7gxjS1Bocu0EHMjaXLL6yGofJeQAQG5if8pdcyoZ0obthFXND0fSVKIXtHqO+ipg==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr12856478wmh.89.1596810402872; 
 Fri, 07 Aug 2020 07:26:42 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.136.3])
 by smtp.gmail.com with ESMTPSA id b139sm11173383wmd.19.2020.08.07.07.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 07:26:42 -0700 (PDT)
Subject: Re: [PATCH 037/143] meson: add qemu-bridge-helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <1596741379-12902-38-git-send-email-pbonzini@redhat.com>
 <503aefcc-7b7b-2558-1355-cb443c32d3e2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <47bb9ff6-4162-6c56-5b21-74993ffae81e@redhat.com>
Date: Fri, 7 Aug 2020 16:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <503aefcc-7b7b-2558-1355-cb443c32d3e2@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:00:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/20 15:20, Philippe Mathieu-Daudé wrote:
>>    endif
>>  
>> +  if host_machine.system() == 'linux'
>> +    executable('qemu-bridge-helper', files('qemu-bridge-helper.c'),
>> +               dependencies: [qemuutil, libcap_ng],
> Is libcap_ng still optional?
> 

Yes, if a dependency is absent it is simply left out.  See
contrib/vhost-user-scsi for an example where the executable is disabled.

Instead, if you want a dependency to be mandatory you have two choices:

- to break the build you use "required: true", see the SDL conversion
for an example

- to disable executables there is a thing called disabler but we're not
using it because it's confusing.  I was thinking of adding an
"or_disable()" method to dependency objects, but I have never
contributed it.

Paolo


