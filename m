Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB645B91A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:32:48 +0100 (CET)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqW7-0005lG-U2
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqTC-0001bo-Gn
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqTA-00074t-UT
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637753384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipVe2ec8Gv/RnabjcRjn6IiSFr34EhswfI7Zt5rybGQ=;
 b=OrjS8xNKNB+L7TkPfBWhCna6SzVHaUpFXZwy7qeClB5gEKxNaTQA5pEnKsxoeO8HkaKuM2
 zacAGVBORmOURRekFLYzcgdzEMw1rl12Z158s8Hkfp0pMhhl6RxktlwvmnlqFPdQWXLNUY
 Y9hV4la67bKDD0lpwCpdLdfFLwh7CMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-S45En8s3P9WH3i2ifpZJyg-1; Wed, 24 Nov 2021 06:29:41 -0500
X-MC-Unique: S45En8s3P9WH3i2ifpZJyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso1597560wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 03:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ipVe2ec8Gv/RnabjcRjn6IiSFr34EhswfI7Zt5rybGQ=;
 b=2nM3EooyGp9uQrEgNAT4jGWwZ9r1Bo6zOR6QWMfV8z1w+jrmRmISxXAd2NHEzffn8D
 5JQ5xNLqOp1Wp5UpUf3T5Aiv82WEGQzZ2sBhuio1pZYE3YWUh+Q86woH63iBXmnH6/Dj
 BqbF/mkljfrXDgWDDK7EVXylCUogu2IjzovcvDqfJh2+U5MqLOFpw0XdlpdyBhzqJS2a
 f5Ur59YV6uAPF9N2meQE0gKL7zVZA7DbjZgYreMRkD7ZNzLQjcqk1PY3O2CgDPwY1p4x
 R+h3BsL+VKsYlijvgHyXsHWsrvEo0VV5ZUtyxC/74hHbwF1jAmZyLbOBSTjPbwWhyGtQ
 krDg==
X-Gm-Message-State: AOAM530oe64fbl4j5Vmvc6oQlHhMHEzMhl/Ux5RB3rT/WbHYptQH22Ba
 sEGYUK9bsxUHVQJo2pVlzS8RBCfW7MI3z5xlSc+z2Tl+CXz3rJV7rzh6HQoCt531deEWVCqHdUQ
 iJ27gNWTWoLYsfvA=
X-Received: by 2002:a5d:4704:: with SMTP id y4mr17187349wrq.85.1637753379958; 
 Wed, 24 Nov 2021 03:29:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvw93uDEuH3pzGgArr+8Z/L2zeAD76UwMztqfpWZ5DpXjIdx3PgzvO66aJ3T9zPms0PmNwcA==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr17187320wrq.85.1637753379774; 
 Wed, 24 Nov 2021 03:29:39 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l5sm18430303wrs.59.2021.11.24.03.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 03:29:39 -0800 (PST)
Message-ID: <f61f2958-8418-9045-7345-6d2d5dcde590@redhat.com>
Date: Wed, 24 Nov 2021 12:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211124080519.440677-1-philmd@redhat.com>
 <YZ4PyT26uHZiUgjk@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZ4PyT26uHZiUgjk@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 11:11, Stefan Hajnoczi wrote:
> On Wed, Nov 24, 2021 at 09:05:19AM +0100, Philippe Mathieu-Daudé wrote:
>> Add a page listing QEMU sponsors.
>>
>> For now, only mention Fosshost which requested to be listed:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> 
> I don't know if Azure Cloud, PLCT, CIP United, and ARM wanted QEMU to
> list them as sponsors. Sometimes organizations do not want others to
> claim an association with them. Are there links to email threads or
> pages where they asked to be listed or gave permission?
> 
> Without that info reviewers don't know whether it is appropriate to list
> these sponsors.

Alright, v4 sent.


