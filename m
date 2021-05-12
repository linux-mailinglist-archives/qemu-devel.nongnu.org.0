Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51637D386
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:23:34 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtW9-0003HP-8U
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtQH-0003wJ-Rm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgtQ8-0002Q9-Im
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620843439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoyfk9NnQ9AbcG7Q6fJLuxt6kwST0YMCumLwcgd3cc8=;
 b=Tux5fVCvzH9RZIo7g97B7XkjZCctp2o0stHgbjRLZ2O01KGsxbx9GRDECiAnbkkMiL+OXE
 pCkK3pNl7VoxCr8E0tuf5TCLHjDH6ir4arP//r8vP+bBO/hQM7p4rT2R+2dznpjdPJ9yMt
 YeyMeZo5SOrFVqqAxUWCQtLVcXl89AU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-LoKhnsivOayhUu2jfMVZnw-1; Wed, 12 May 2021 14:17:02 -0400
X-MC-Unique: LoKhnsivOayhUu2jfMVZnw-1
Received: by mail-ej1-f72.google.com with SMTP id
 z15-20020a170906074fb029038ca4d43d48so7544455ejb.17
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eoyfk9NnQ9AbcG7Q6fJLuxt6kwST0YMCumLwcgd3cc8=;
 b=tdHNeTskiTYxyTjGbETyExDajYqsCxgMZXzYuSKRiofwrcWdBDbJgojQjhQ3PblZqc
 yB25YAVicOF/MJaRHI16ks3ZQD5YirojrodZ/DH6N1oJSxNH3HJZtX0NH4oBGDX3GQv1
 p16bYMcok28TmCf+mLML2qhHEOJz2zUKItxWN+FfZZyPTVar1tokEvP+MvCoil3ciBpp
 zR3h90t1prYy+YMMY3/zR5EfgGdhHSLcZieFYNSmS5k/V7LisY6a/y+TsHv856wrcsL+
 NRxTGrY46n/LxqiPcd93oVEzZMxMcJQ0tG8EO7Cim+rjWIHto/iTRtpw7r06y1SGoEX5
 v+EA==
X-Gm-Message-State: AOAM531H6vIhy41qN6jCuhV6JErNsBCePEV08PRwiWQ+Z6fkxq4Hfgev
 UqbxKXPxYja3I7ThU4BtH39whszOBtnkuXD0DBdAMl9ghtYPmZeHvk84gVra6kwi6nOQqnr0Rku
 K6LyrVCY/ZRYldDE=
X-Received: by 2002:a17:906:9444:: with SMTP id
 z4mr39134846ejx.330.1620843421208; 
 Wed, 12 May 2021 11:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdAK3fykzGVtjsuKfeJEIs7ih72j2OoNu98hnCrcftu5Ird98SBqVUGEm+y1fiDiIIFS2W8Q==
X-Received: by 2002:a17:906:9444:: with SMTP id
 z4mr39134833ejx.330.1620843420995; 
 Wed, 12 May 2021 11:17:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zo6sm291412ejb.77.2021.05.12.11.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:17:00 -0700 (PDT)
Subject: Re: [PATCH] add Visual Studio Code configuration
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512100906.621504-1-pbonzini@redhat.com>
 <68f9e434-352d-e98c-9bd1-2fd291d2d9be@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <786362f4-4881-6bb7-2eaa-a7f876555f9e@redhat.com>
Date: Wed, 12 May 2021 20:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <68f9e434-352d-e98c-9bd1-2fd291d2d9be@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: eesposit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 13:08, Philippe Mathieu-Daudé wrote:
>> --- /dev/null
>> +++ b/.vscode/c_cpp_properties.json
>> @@ -0,0 +1,13 @@
>> +{
>> +    "configurations": [
>> +        {
>> +            "name": "qemu",
>> +            "includePath": [ "${default}", "${workspaceFolder}/linux-headers/**", "${workspaceFolder}/include/**", "${workspaceFolder}/+build/**"],
> 
> Not sure about +build... This produces:

Oops, should be ${workspaceFolder}/${config:mesonbuild.buildFolder}/**.

>> diff --git a/.vscode/settings.json b/.vscode/settings.json
>> new file mode 100644
>> index 0000000000..efbbb4f88b
>> --- /dev/null
>> +++ b/.vscode/settings.json
>> @@ -0,0 +1,11 @@
>> +{
>> +	"files.associations": {
>> +		"*.mak": "makefile",
>> +		"*.c.inc": "c",
>> +		"*.h.inc": "c",
>> +		"*.json": "python",
> 
> When opening .json I get many:
> 
> "true" is not defined (Pylance reportUndefinedVariable)
> "false" is not defined (Pylance reportUndefinedVariable)

I'll remove this then.

>> diff --git a/.vscode/tasks.json b/.vscode/tasks.json
>> new file mode 100644
>> index 0000000000..362821043e
>> --- /dev/null
>> +++ b/.vscode/tasks.json
>> @@ -0,0 +1,23 @@
>> +{
>> +	"version": "2.0.0",
>> +	"tasks": [
>> +		{
>> +			"type": "cppbuild",
>> +			"label": "C/C++: build active file with compile_commands.json",
>> +			"command": "python3",
>> +			"args": [
>> +				"${workspaceFolder}/scripts/rebuild.py", "${file}"
>> +			],
>> +			"options": {
>> +				"cwd": "${workspaceFolder}/${config:mesonbuild.buildFolder}"
>> +			},
>> +			"problemMatcher": [
>> +				"$gcc"
>> +			],
>> +			"group": {
>> +				"kind": "build",
>> +				"isDefault": true
>> +			}
>> +		}
>> +	]
>> +}
>> diff --git a/scripts/rebuild.py b/scripts/rebuild.py
>> new file mode 100755
>> index 0000000000..e35e08f42d
>> --- /dev/null
>> +++ b/scripts/rebuild.py
>> @@ -0,0 +1,22 @@
>> +#! /usr/bin/env python3
>> +#
>> +# Author: Paolo Bonzini <pbonzini@redhat.com>
>> +#
>> +# This program compiles the input files using commands from the
>> +# compile_commands.json file.  (Unlike Make/ninja, the _source_
>> +# file is passed to the program rather than the targe).  It is
> 
> Typo "target"
> 
>> +# mostly intended to be called from editors.
>> +
>> +import os
>> +import sys
>> +import json
>> +
>> +with open('compile_commands.json') as f:
>> +    cc_json = json.load(f)
>> +
>> +paths = set((os.path.relpath(i) for i in sys.argv[1:]))
>> +for i in cc_json:
>> +    if i['file'] in paths:
>> +        os.chdir(i['directory'])
>> +        print(i['command'])
>> +        os.system(i['command'])
>>
> 
> I got these warnings:
> 
> [5/12/2021, 12:24:04 PM]
> "${workspaceFolder}/builddir/compile_commands.json" could not be found.
> 'includePath' from c_cpp_properties.json in folder 'qemu' will be used
> instead.

"builddir" must be your mesonbuild.buildFolder.  You must first run 
"configure" manually in that directory (or adjust the configuration of 
the Meson extension if that's what you prefer).

Once you do that, Ctrl+Shift+B works.

Paolo


