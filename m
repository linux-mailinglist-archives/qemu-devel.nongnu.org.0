Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91D499139
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:12:55 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5hu-0000ca-78
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC4wa-0002Ey-8t
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:24:00 -0500
Received: from [2a00:1450:4864:20::42b] (port=34530
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC4wY-00032h-FE
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:23:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f17so15524648wrx.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 11:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S9K2sUVFqDzpMuWjzRu8K0ukmhVp8oopLWNqFhS2xNM=;
 b=Okx6s7YwSQ9vR6zxSCIEg5TJXwzOYeGdaMUxAZ8uhU2AJ0bKlX8EbQlxmVpzZym8t/
 pLp+m9+c81NdIO8RABmaEsDChZmZcfnMcbY7pRGn0HbKrQgMSnpvVEBKrjZidovkn7L0
 MFXMAQ+cFaUgAtxvD6JPOkPFhBAbSshvgaRb6JDjp/MFs7SsaoAAiG4P7GPzDJ5E/2zP
 LLJpngQXr2yPhkjk198zXzONZU2SK3AAuX99k0Uod341TtR/hIziPfIZa+lFcAs6Bp5M
 Q/bP+yiA3erL1N/lBuRrDSeKU+CMcdWlGf8M0lyP5aZPLpbEgGqrIKDn9FE1+lCRhyiw
 3hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S9K2sUVFqDzpMuWjzRu8K0ukmhVp8oopLWNqFhS2xNM=;
 b=C09ZJPqo+cpdVxDNd6lsA9mXv/7l5oV/EAi3jGDsOKFu+MQ5M/i9oo8rJ9iDEHKrma
 qQcZJ8Kh5nfL3UcM5rUX7QVcbOPmSnp2nbSJa62l30b63W6Vd4W1WaEr19Gbk4TrnHtb
 agtQAGYQgOa7UeDkfMp3/9yoqgrnOBXNbXxJ4nMGixYTZG6mtbPQZNht3+thEkAw7xY8
 kivy4QH6B7C35a2ptPbjwn1tHK9Pq+7Y0vdJ2P0EpSTB/gsPsS9gqfNUCUxLncEGHOmo
 TbmSqlLBew2at0IhfasNs+H3rp3whKJV2RlMt8xMzHaEWVbxz3HP21m7e1zUEPscDBFY
 qIRw==
X-Gm-Message-State: AOAM530aTFJWn29Ds5V6JEb9GNmeIp+PXwLh6GCSgkp5YvGNzIbq2zCD
 WOap8yzECJg8kGv/UYEKk8FGUw==
X-Google-Smtp-Source: ABdhPJzNUIMAF8ES6sekg++OXNCl1Z2HLCnZtuUYbNEvTKXVX5lW/k6zeaDppokJ+CDgMhX7OWpxYw==
X-Received: by 2002:a5d:6f10:: with SMTP id ay16mr7586305wrb.183.1643052236736; 
 Mon, 24 Jan 2022 11:23:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p14sm5403211wrr.16.2022.01.24.11.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 11:23:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D9191FFB7;
 Mon, 24 Jan 2022 19:23:55 +0000 (GMT)
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org>
 <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Mon, 24 Jan 2022 19:16:30 +0000
In-reply-to: <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
Message-ID: <87ee4xdjjp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 =?utf-8?Q?Daniel_P?= =?utf-8?Q?_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 1/24/22 11:55, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> This is my last respin on this series which is fully reviewed.
>>>
>> <snip>
>>=20
>> Just to note the "b4" application of this broke the From addresses. If
>> you see the lore copy:
>>=20
>>   https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat=
.org/
>>=20
>> all your From's are via qemu-devel. Have you changed anything about your
>> submission process?
>
> No. Maybe the list changed something again? Similar problem occurred
> 18 months ago IIRC. Not sure what I can do, the domain misses SPF/DKIM:
> https://toolbox.googleapps.com/apps/checkmx/check?domain=3Damsat.org

I thought so but others in the archives are fine. I take it you can't ask
the owners of amsat.org to expand the SPF setting or use the MX server
indicated to send emails?

Otherwise it might be worth either getting your own gmail or domain for
posting.

>
> If it helps you can get them on my branch macos12:
> https://gitlab.com/philmd/qemu/-/compare/5e9d14f2...36d00943e?from_projec=
t_id=3D6939745

I nabbed it with my old-school patch handling which still works but
doesn't auto collect tags for me ;-)

--=20
Alex Benn=C3=A9e

