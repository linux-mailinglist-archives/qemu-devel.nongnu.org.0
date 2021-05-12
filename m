Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1D37CD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:10:03 +0200 (CEST)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsN0-0006W8-8p
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsL7-0004NY-6W
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsL5-0002dr-Fe
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74GjydmdjNsUTCkjXokTasgIEz6bFu+hasDG7hYUkpA=;
 b=LhdUcxJAG8t61fFHjc44KmDEYPfH/QmYGsjE7nGwyvwYZmAO8Yj1Mq11D+34Pc9J/QE7JM
 r2PkIiscoFbtG93az3G9KZUkcDoE+91Dj2I5itGZXhnjdTNKlUzffbCki1h5w3cZqndvFC
 cKNkduhn+8+ezrm1vrLd7a1PGLvBBdc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-FkBqL7GXMZO-PdO9c-LsBA-1; Wed, 12 May 2021 13:07:59 -0400
X-MC-Unique: FkBqL7GXMZO-PdO9c-LsBA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a19-20020a1c98130000b029016acd801495so999803wme.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74GjydmdjNsUTCkjXokTasgIEz6bFu+hasDG7hYUkpA=;
 b=W6Gc97ALcb81wJTQuajUMWUzESDTZV7YP7sb3KITdNCbBjd3rxpfOKn4acCOXqRkHt
 9pUbXB/8AtilBRKzeIrOUuerFvantvn069BDyi1lZKI+J65PYkOtDEqpRNbdAsc0Fg4o
 772280IUZegWnsaVN/x1R/Osavgjqorg1CanOMe3IIdSPPpfmPm+XJPf82AGiqIh89kR
 EyiuY8/mHUOuJ1u9J+g36eRDXZNcemRlcs+NG91DOLGpFhfETt/g2HrYE2eIWWMvfb+U
 04bU1ocL08MU813qg/1p3g+LlilMLMqgl9ikxe2JS6HiAN0aGxQdahllgfPIuqevbWjY
 lDWQ==
X-Gm-Message-State: AOAM532N9kOnYUGuyyzKMK8IKwyYueyIoEK9sy/lo6RHs92X8SyrfTAP
 Ozga5cfLolpjMDOdyMkyq4ZL+vfMMdLebSsP8HsyMJycVuEWUtQmGLhZesxE0FawgZjPAn5+DTi
 f40KNwWzM25WEgAM=
X-Received: by 2002:a7b:cc19:: with SMTP id f25mr39254130wmh.153.1620839278304; 
 Wed, 12 May 2021 10:07:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkIJNJXJqJB85vm49bkVBRPKLhU9Mf6R5jhGoQQ3hveI1V8Y2ZY3dWznKKE3xKWtbrhugyIg==
X-Received: by 2002:a7b:cc19:: with SMTP id f25mr39254115wmh.153.1620839278124; 
 Wed, 12 May 2021 10:07:58 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832bb.dip0.t-ipconnect.de.
 [217.232.50.187])
 by smtp.gmail.com with ESMTPSA id y17sm268400wrw.90.2021.05.12.10.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 10:07:57 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210512162412.338120-1-armbru@redhat.com>
 <20210512162412.338120-3-armbru@redhat.com>
 <a8c579c8-e361-e3ef-0f4d-d902e12c7525@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 2/5] Remove the deprecated moxie target
Message-ID: <b696a2c2-1a95-8442-1b2f-2b7e02f6ef0d@redhat.com>
Date: Wed, 12 May 2021 19:07:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a8c579c8-e361-e3ef-0f4d-d902e12c7525@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 18.37, Philippe Mathieu-Daudé wrote:
> On 5/12/21 6:24 PM, Markus Armbruster wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> There are no known users of this CPU anymore, and there are no
>> binaries available online which could be used for regression tests,
>> so the code has likely completely bit-rotten already. It's been
>> marked as deprecated since two releases now and nobody spoke up
>> that there is still a need to keep it, thus let's remove it now.
> 
> Isn't it already in a pull request sent by Thomas last week?
> (I ask because I based a pair of branches on it)

My series got stalled because there were issues with incremental builds. But 
Markus series here has a chance to get through since there are also changes 
to the configure script in here, so this could cause the rebuild to trigger 
correctly. If this pull request survives Peter's integration tests, I'm 
happy if the moxie patch gets merged this way!

  Thomas


