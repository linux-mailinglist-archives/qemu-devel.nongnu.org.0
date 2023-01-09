Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61076661F76
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 08:52:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEmvN-0003qE-RP; Mon, 09 Jan 2023 02:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEmv6-0003pj-1W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEmv4-0002fJ-98
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673250607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSKbmtwaKQhEfUd7yjEIXopbI6LKebIyg9fufV48sUQ=;
 b=gU+u0/ieVEn/P70ZaRDr3xd3IZKDV488bxrVqtFb2zq5DElMfglebg8y4AdCICAiYSgVXj
 fYZi8vzVGdthBfUo8riTt+Pnc7hz5a03qnCTG1leT4YodMpR+7nGkpUjSVAF6RQQTNH8F5
 2iSmeVZxlZu/jNd+0s75WsnktRz1CFo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-WWVPt7eoOMOoQxG97-12Ew-1; Mon, 09 Jan 2023 02:50:05 -0500
X-MC-Unique: WWVPt7eoOMOoQxG97-12Ew-1
Received: by mail-qk1-f200.google.com with SMTP id
 r6-20020a05620a298600b007025c3760d4so5999019qkp.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 23:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oSKbmtwaKQhEfUd7yjEIXopbI6LKebIyg9fufV48sUQ=;
 b=WVsRrd+ws8hWCaGttpyQjq0wuS+tdLTJO8SU29rSOWPRoickDh81Rz04vB8VD4gFJZ
 UaaMAT5RuFamQqB0xdtlc/cLXe8cHrFrjJKJvyhhQJUifDCiylK06NT2UECQKe9VBZNx
 SaLbWjrRRS+MCPooORn5f8CBri36W4JD0n5yD3h8FXFDKdXVrDaxcvMJT8gcG0WqQxF0
 1gHtaZYdyx3Vs5uU2BkC4rORi5g0YfzZnptHjVt76KprokpFyyHNJAABccQUpejnXJ5I
 JVG4Lo62kq1sy0IaXhPc4ZZERBOul4okYllWCpELMvySIco8Xy3xSoSs4Gpywh1ra+KZ
 4cQQ==
X-Gm-Message-State: AFqh2kps+yOe65JTXzdxDQQ81zf3SsLIgUxv61tjp4mz2OwAzBOA1Zfx
 pxrN3kFJUlL8IxkRaoJaLJ1ht1wmig31TpwehtssnyNGdLTvjumoO5AI1JAyfvhwFavMoZmI0r6
 h48IqphZnM92X/wo=
X-Received: by 2002:ac8:7318:0:b0:3a8:1178:5651 with SMTP id
 x24-20020ac87318000000b003a811785651mr79118610qto.37.1673250605413; 
 Sun, 08 Jan 2023 23:50:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsE5uPbTsbsCHQ4zzFbDmcW3iqUZ1SYD8HDf+m+DmX0yM+MJJMj2dDp0VKg83gZQCC+NR0kdA==
X-Received: by 2002:ac8:7318:0:b0:3a8:1178:5651 with SMTP id
 x24-20020ac87318000000b003a811785651mr79118603qto.37.1673250605157; 
 Sun, 08 Jan 2023 23:50:05 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-204.web.vodafone.de.
 [109.43.179.204]) by smtp.gmail.com with ESMTPSA id
 x10-20020ac87a8a000000b003a7eb5baf3csm4208334qtr.69.2023.01.08.23.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 23:50:04 -0800 (PST)
Message-ID: <ae618c74-4a5b-79df-1285-dc336430e0a4@redhat.com>
Date: Mon, 9 Jan 2023 08:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
References: <20230106082853.31787-1-thuth@redhat.com>
 <CAFEAcA_0hWNJWhmjW=yjSVgy1HK4c-_G3DBNPUpbj5KKpjjqeA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/15] First batch of s390x, qtests and misc fixes in 2023
In-Reply-To: <CAFEAcA_0hWNJWhmjW=yjSVgy1HK4c-_G3DBNPUpbj5KKpjjqeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/01/2023 15.25, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 08:29, Thomas Huth <thuth@redhat.com> wrote:
>>
>>   Hi Peter!
>>
>> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
>>
>>    .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-06
>>
>> for you to fetch changes up to 975f619662a46cb5dc7a3b17b84a1b540fb7df5c:
>>
>>    .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-05 21:50:21 +0100)
>>
>> ----------------------------------------------------------------
>> * s390x header clean-ups from Philippe
>> * Rework and improvements of the EINTR handling by Nikita
>> * Deprecate the -no-hpet command line option
>> * Disable the qtests in the 32-bit Windows CI job again
>> * Some other misc fixes here and there
> 
> Hi -- this produces new warnings during 'make check' on the bios-tables-test:
> 
> qemu-system-i386: -no-hpet: warning: -no-hpet is deprecated, use
> '-machine hpet=off' instead
> 
> If we're deprecating that option, can we update the test suite
> to not use it, please ?

Oh, looks like these warnings now only show up in meson-logs/testlog.txt and 
not in the standard output anymore as they did in the past? ... that's why I 
didn't notice this.

Thanks for the hint, I'll write a patch to fix it.

Do you want me then to respin the pull request with the patch included?

  Thomas


