Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D498834E627
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:14:20 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCKB-0003ow-27
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRCIU-0002PL-3U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRCIK-0002g3-AF
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617102742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXFtwJewK9FPs27cH25Iw+ZoTh+SjZVxmKC/dOAnVZw=;
 b=YX2U/6c8nWshevqUiyeS4ekz4aHc1sH8i37AgEaNrYjwDLTu1XTOWyW2ODUZ60t9T6em2R
 QoN1eJHqTM/3gKy9KO7UfcPPfNyUKcogojsiS2aeFEpU29e/bf5EG3r2Oua/OdwtraLT4D
 Stu7YOFkEVI6nK6xTrafVIbb/AcUFJQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-Qz8wixdQN2O9UGk9Zbp0Jw-1; Tue, 30 Mar 2021 07:12:20 -0400
X-MC-Unique: Qz8wixdQN2O9UGk9Zbp0Jw-1
Received: by mail-ed1-f72.google.com with SMTP id r6so6548430edh.7
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 04:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jXFtwJewK9FPs27cH25Iw+ZoTh+SjZVxmKC/dOAnVZw=;
 b=hY1HEd4ekokhyXQtlzpWTNZ+4UU32RgE/YIWrlYo51Rr3IvloEGq3ZuBRUimS4lHp2
 2NsXu03vGbsrjCtemM121kziEPD70YdibwS1qz6I/mJMdehSMYaBEbVDgxv9z3+H/Q2W
 W5xIA7ukLBMmsHDEKevxKFNqVKkfB9okkU+4NLiYp4Y0+/hCmUbimuSPhgSB3yHXI99d
 M+yhokD8cKtc1WROGzZFpkcA5QgqiOrrXl3vu7UubRe+onmEMA4ziC9mPVid7952BX8e
 P3HhoztpH5sU84udVlXVcIFptIZehqejj+UesxlXYeK4cHI1C8IY1gJQPHI44gZm9xa/
 fj7A==
X-Gm-Message-State: AOAM532ercxEzTncII41CWTsMg6D07SJxBE72l5qf1hqJKhxgwdb6VJk
 uKVdg7KltDW/Plgp1Hk3g7eb0lMM6rgouP+VHFyp0u+YPDzsyebMO+PtAkC4gqbpBV2xPkNfDwM
 ex8MDNlSNUWron+o=
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr32782281ejh.408.1617102739040; 
 Tue, 30 Mar 2021 04:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1CWCpguJZKepMlBBDwvWVLq6CS9fWdtoWwW/xUl+O6MHH1irODOwUCFgUujhuOXns8vDIyg==
X-Received: by 2002:a17:906:2c0c:: with SMTP id
 e12mr32782267ejh.408.1617102738853; 
 Tue, 30 Mar 2021 04:12:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s9sm10497814edd.16.2021.03.30.04.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 04:12:18 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210326142359.431127-1-pbonzini@redhat.com>
 <20210326142359.431127-5-pbonzini@redhat.com>
 <57668708-22b3-f21f-e737-62bbe425f763@redhat.com>
 <51523e26-a184-9434-cb60-277c7b3c67d6@redhat.com>
 <62c3d8c9-86d4-0fa1-1b43-881a84c852eb@redhat.com>
 <3dabab90-5a60-2cfd-0527-df709fe3dea0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57ccd84c-2413-f9d7-2784-82bac68b1841@redhat.com>
Date: Tue, 30 Mar 2021 13:12:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3dabab90-5a60-2cfd-0527-df709fe3dea0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 12:57, Max Reitz wrote:
> 
> 297 says:
> 
> check:125: error: Argument 1 to "Path" has incompatible type "Optional[str]"; expected "Union[str, _PathLike[str]]"
> Found 1 error in 1 file (checked 1 source file)

Weird, I had tested this and I cannot reproduce it.

> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index df9fd733ff..7c9d3a0852 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -122,12 +122,13 @@ if __name__ == '__main__':
>               sys.exit("missing command after '--'")
>           cmd = args.tests
>           env.print_env()
> -        exec_path = Path(shutil.which(cmd[0]))
> -        if exec_path is None:
> +        exec_pathstr = shutil.which(cmd[0])
> +        if exec_pathstr is None:
>               sys.exit('command not found: ' + cmd[0])
> -        cmd[0] = exec_path.resolve()
> +        exec_path = Path(exec_pathstr).resolve()
> +        cmd[0] = str(exec_path)
>           full_env = env.prepare_subprocess(cmd)
> -        os.chdir(Path(exec_path).parent)
> +        os.chdir(exec_path.parent)
>           os.execve(cmd[0], cmd, full_env)
> 
>       testfinder = TestFinder(test_dir=env.source_iotests)
> 
> 
> But now these are so many changes that I feel uncomfortable making this 
> change myself.  This series only affects the iotests, so AFAIU we are in 
> no hurry to get this into rc1, and it can still go into rc2.

Go ahead and squash it.

Technically I think resolve() is not needed because we're basically just 
doing "dirname" and not going upwards in the directory tree.  That would 
leave the smaller change in message id 
51523e26-a184-9434-cb60-277c7b3c67d6@redhat.com.  However, it doesn't 
hurt either and others may have the same doubt as you.

Thanks Max!

Paolo


