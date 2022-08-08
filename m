Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38B58CDFF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 20:50:51 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL7px-0005dk-Vl
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 14:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL7jC-0001X9-13
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL7iz-0001nA-WA
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 14:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659984217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tb5qQd9ote/mnA62bLVoWWm5aGwF6oTbjveRVkQp/lc=;
 b=HkqkJwSs0U0Syog15gZeZ+mO9RTj/BqTqEsNGp3hfR/5lDIKtZpXk/hat7OFf2rOYBveQW
 Py8jUWb9mrr/9rir97Ae8hOfT+f33cWFIjkjBafbEHjqKlecwVkTc8Az/Dk9Z5ojk9Xm1c
 5SDSGONj5ykTM6XI3ug9yUdjhpwWi5w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-0WEzJVWBMjSjJp9AYr9kNQ-1; Mon, 08 Aug 2022 14:43:32 -0400
X-MC-Unique: 0WEzJVWBMjSjJp9AYr9kNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v130-20020a1cac88000000b003a4f057ed9fso5007268wme.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 11:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Tb5qQd9ote/mnA62bLVoWWm5aGwF6oTbjveRVkQp/lc=;
 b=ZpJ13qxzh0IWOFuCh9zRt/WNOQkNsi50ImihPfNdFQvmzkpElvMuC36+O0EYDjWMEy
 fZh5ucV8BNrwMJ/FYlAdFzsHF55U4sVxeFnezPkvUBXiA819PsUnEcxhVzq9Z64XkID/
 zyvWzuQ1cwYWKa4CTVze6kJxw7Ae5tVwX51ilQAYh6dAdRF5WFuS8cmNaRl2krMaFN7b
 I+k6w8ozxj017D7npdnTiXAQPxcttZuKw8uhCyKwqLvE1oyrn2UYeOCAolAZ3i0TS8xF
 6oLsJWP+jIL/j++T+7k3v+LOMqIvZAVV0F2wI5L32+S2Oa7Tqx+jYszMNA6RepGkG5Ma
 BWaw==
X-Gm-Message-State: ACgBeo2n4NXCuKBxPBBhAQBh4D7W/iINA1pixhG0drUk8l9I1IfnUgY+
 AVkJt6zoUVcmPFFkFDQ6FxHyZgmFVbGiuScdCqx8ilkE1jpVagq9gLPtWMolA2gvyWk3MIK5f7f
 JwckeDNc2d80ZF2o=
X-Received: by 2002:a5d:6348:0:b0:220:5edf:c3e8 with SMTP id
 b8-20020a5d6348000000b002205edfc3e8mr12254393wrw.255.1659984211765; 
 Mon, 08 Aug 2022 11:43:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73CVegiv40mA7/wljsOr8oOrDPjJFLUxluMOSo+do6LHC3xiXfkg75sX1a5dUVc0hm1ENmwQ==
X-Received: by 2002:a5d:6348:0:b0:220:5edf:c3e8 with SMTP id
 b8-20020a5d6348000000b002205edfc3e8mr12254386wrw.255.1659984211578; 
 Mon, 08 Aug 2022 11:43:31 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 n17-20020a7bc5d1000000b003a52969e89csm9056126wmk.4.2022.08.08.11.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 11:42:44 -0700 (PDT)
Message-ID: <536c6605-fd29-dbca-8633-944656e6dc8e@redhat.com>
Date: Mon, 8 Aug 2022 20:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: how long do we need to retain gitlab CI job stdout logs?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_Y=ugD=Oh=fJhi=9GE73zpWnp0YC9dOoJazHg1PgXu=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/08/2022 19.47, Peter Maydell wrote:
> Hi; I just reduced QEMU's storage usage on gitlab by 130GB (no typo!)
> using https://gitlab.com/eskultety/gitlab_cleaner, which Dan helpfully
> pointed me at. This script removes old pipelines, which take up a
> lot of storage space for QEMU because they include the stdout logs
> for all the CI jobs in the pipeline. (Gitlab doesn't expire these,
> either by default or configurably -- you have to either manually delete
> the pipeline in the UI or else use the API, as this script does.)
> 
> I somewhat conservatively only blew away pipelines from before the
> 1st January 2022. I feel like we don't really even need 6 months worth
> of CI job logs, though -- any views on whether we should be pruning
> them more aggressively ?

I'd say we should at least keep the logs of the last 4 to 5 months, i.e. the 
logs for one release cycle, so we can check these logs in case we introduced 
a new bug in the current release cycle.

  Thomas


