Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CC3F48F9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:51:13 +0200 (CEST)
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI7Xh-0000st-SD
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI7Wn-0008My-T7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI7Wk-0001CX-9I
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629715800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kf0IiCCs6QqNEpDxIMAPE1m7/FKhjgg2teKrrLJ/E+M=;
 b=PUdodBRJtvEn4nCi39rv138PF5DNRAuhOrbm34rW5oDAhumjhAwzQzSlBT86QJgKZ98Vlj
 pOovzT2XHSQ4bbkDPyAHzxTXjBdZsE8lsJDEdtKOaXXNoEWiRyPcRClShHxTfUvSebLQLA
 MVqIn/kvw5QK+RFtxx3SmhgsjDWpD3A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-9GokjKlPNlSNG3DLdCd5fg-1; Mon, 23 Aug 2021 06:49:58 -0400
X-MC-Unique: 9GokjKlPNlSNG3DLdCd5fg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m13-20020a7bcf2d000000b002e6cd9941a9so8308912wmg.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kf0IiCCs6QqNEpDxIMAPE1m7/FKhjgg2teKrrLJ/E+M=;
 b=R58yxJM0OpRl7PnMit2h1o7mwgOs5Q64WT0QiuGsRRgmwSIJ0Ay9i0Mf4T5EO1tcfZ
 DsDyvBl7vcn17uyZj5XuPsy+5lRACN84slXtM+ICWL4cy8DRLTwoH8a7NaGmAUoJUzgQ
 Vppws2VDJqx+sygKMp1aI8qm9AOnHRs7OK+Zz/Ba9zfz+1u4/kOQ//4dF6brkT7pQvMP
 m6eHpx4C2xIWv2Ew+G6YbL94VOkhVxXIHij0uvC1nEKF8Tnll2gLPI9QoSqEL/4So5DW
 ulhsIgAvT1oQW2kkW3yorPVW1YQ/QxDGMP3R8g817YmxLUbe+tlZbLR9BAPHvBUiBZDD
 Am2g==
X-Gm-Message-State: AOAM5300Yth4yRsQ54e7ZSNd3+wlYtdk9cWhVDRM7FD3Q9H0inBMpA3F
 r6LaR1RJ1p3yqd9QfQMeMtmT306bpYQKHkOZAyl7q+oloDdj3XvYcSWQRT+ww4hIo2lLcjvkVkp
 KYZkPtw7IdXZklemOR7g34vS/4jc5iBPyAfdq5mNSQko17Q09P06KAfS6HHUAELvs
X-Received: by 2002:a5d:570c:: with SMTP id a12mr3686929wrv.117.1629715796496; 
 Mon, 23 Aug 2021 03:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcAwSVyJ0SgfTSOGRiJ80Vp9aWW/gsHu+Phy80Dt1sYzogbUGWr75vLYOMuA0MKAIqbKapJQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr3686919wrv.117.1629715796307; 
 Mon, 23 Aug 2021 03:49:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j37sm11126430wms.39.2021.08.23.03.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:49:55 -0700 (PDT)
Subject: Re: [PATCH qemu v2] docs: how to use gdb with unix sockets (v2)
To: Peter Maydell <peter.maydell@linaro.org>,
 ~archi42 <sourcehut@mailhell.seb7.de>
References: <162867284829.27377.4784930719350564918-0@git.sr.ht>
 <CAFEAcA-GOO6H4DgneNOuOQKxTO7=RahUzhrubjU9sBFLxPQ+nA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7cc567ca-bae7-8400-bb6f-625b8fcaaa68@redhat.com>
Date: Mon, 23 Aug 2021 12:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GOO6H4DgneNOuOQKxTO7=RahUzhrubjU9sBFLxPQ+nA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 12:39 PM, Peter Maydell wrote:
> On Wed, 11 Aug 2021 at 10:10, ~archi42 <archi42@git.sr.ht> wrote:
>>
>> From: Sebastian Meyer <meyer@absint.com>
>>
>> This includes the changes suggested by Philippe.
>> I kept the `-S` in the command line. The user shall
>> use that instead of `wait=on`.
>>
>> Signed-off-by: Sebastian Meyer <meyer@absint.com>
> 
> Thanks; I've applied this to target-arm.next for 6.2.
> 
> I made a few minor tweaks to the commit message and the wording
> of the docs, and fixed a rST format error (a stray double-colon
> meant that the text ".. parsed-literal::" was put in the output
> verbatim). You can look at the fixed-up version of the commit
> here if you like:
> 
> https://git.linaro.org/people/peter.maydell/qemu-arm.git/commit/?h=target-arm.next&id=80acb580a7c98300248794d59bd98a31fb1b1bd9

Sorry I missed the patch because I was not Cc'ed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


