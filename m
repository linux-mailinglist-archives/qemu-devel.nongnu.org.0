Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7D525DBF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:39:52 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQpz-0006eu-PN
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQmD-00047x-Gs; Fri, 13 May 2022 04:35:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npQmB-0002mc-4Q; Fri, 13 May 2022 04:35:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id n10so14845860ejk.5;
 Fri, 13 May 2022 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DCX4SO//tnCxpDOb7Gu1q8IaTQprlXQLEl3ZRmfKAdg=;
 b=QnKCSuHId5rxguBrDpLSq6ZcUR1GyOWMxEsGGVtZL5a6NFStaT96wMNWY6z3qtX8ZB
 5vLM5pjjs/jfHKsJz94TtvFbQlNkIImtJdWNRKvtLL6J3DsZej7/pJnWT8kT+RWkHG6f
 zcGCSGsYU+SsLAZsKQJmX9ySeb1KbeCSxRdVfgF146UoJRI26oXYgsCtmwXjcHvWDEXp
 Bs7KxcLkxTkBpoXkEOu1Ml2BzdS8pBiPt+1OHQy9jekqy/B+fBhFXhmr4YjMpj/YxT01
 8gl3lPlegYhkjIL7iHG0U11lCHkfpLVKXZvtZQY87uRciy4dU8U8gx2g2ic0qyafUCdo
 GP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DCX4SO//tnCxpDOb7Gu1q8IaTQprlXQLEl3ZRmfKAdg=;
 b=KWGxeWZJFObsOGW1TKkHUshg5qgHQrOSeWWWnEwdPAn09oitDo9O8JmmkXfRvDU5iX
 Ix5U01itGonQlC/oNzaku78c4pWi7JHYdl5JInd7fKiDJqHufDmmgbOHfGIpjR521r+I
 LOIray5ey+/s8++3yaLpr3BKVsOhRF/pQT+KMUPRx8JEa/Vop+Ke7GqKtROWyYnuR0ZA
 Igf1Ol+rFZT25XKA/0vmaiYPWhocs48jZObzs6weaMuaagJ+kp+YsY63j/oGQGu6lNGI
 rbQStbSPibMKFPWQcZq0yELZAjcfs1sPy3AG72nbzuYcdBccTIR9l9l+KCKeiYveUMKH
 jbAw==
X-Gm-Message-State: AOAM533xBqYVmcfuP1deeX52lA5rEFgNoZ0l13SzXjGNRe1Uq5jT0woh
 fGwqhUjVKlwSmUkc2GsfC7Q=
X-Google-Smtp-Source: ABdhPJzcvEKIzefWtEmbpjZex/2+PL4YZuqdn38r8xNknHYx/SAw6ZmolW27B4akFtloqph/YuZ70g==
X-Received: by 2002:a17:907:c06:b0:6fa:94f3:df with SMTP id
 ga6-20020a1709070c0600b006fa94f300dfmr3244791ejc.411.1652430950090; 
 Fri, 13 May 2022 01:35:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 zp16-20020a17090684f000b006f3ef214e16sm527049ejb.124.2022.05.13.01.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:35:49 -0700 (PDT)
Message-ID: <411ffce0-6bc2-bbbf-038f-2d3a9dd2aaa0@redhat.com>
Date: Fri, 13 May 2022 10:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 8/9] iotests: fix source directory location
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-9-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513000609.197906-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 02:06, John Snow wrote:
>               # called from the source tree
> -            self.source_iotests = os.getcwd()
> +            self.source_iotests = str(Path(__file__, '../').resolve())

'../' could be just '..', otherwise

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

