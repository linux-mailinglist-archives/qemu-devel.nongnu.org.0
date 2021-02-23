Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D3322D15
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:05:18 +0100 (CET)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZFV-0006GX-GK
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZDB-0004sc-2s
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:02:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZD5-0000hU-Jj
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:02:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v62so2744741wmg.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0O5GtlVxAJsUvILGXbPMAxrAMp9cd8SeKNodS9p/054=;
 b=pm4hNmdgUq2Zf+1ocRBMfCCtB9PXn3f2yLpyZQQIzef/k1q1mrRyTMQzecKc7oWwCM
 337hii+ECF+bu4y9vllPsEDqnrJCdiZhyghKMbj4Pu+rYZL98glqoSAJ1OH/uZi3ygDH
 /Wmm24KCjBzSSNeQH0+pBBOGtpY3g/opf21CelxfjWWykCuEYb/5yo16B9aAxm9DF+P7
 lUm47/mOSESAkdeiZo5RiGyCWx/bC8NGjf4PXdeEhHmFa+osgip728GQmh9C6uiO01y7
 OAb9t+uwjNVQa8TQBcn0w2wm3QGE4jKbwItizDvQUaqAjpim4p9ZJd4VCx+WLZjIQgiy
 gxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0O5GtlVxAJsUvILGXbPMAxrAMp9cd8SeKNodS9p/054=;
 b=TRdbqB6SSdMpNKhZZWpxEy7cycVQOv17OUtdHOrwiF6jfLxCLB0yzavUmabIknQlcd
 a4on2llwKuQCqJGSbwPPgjUMgUDryPT07C99NCrkPUqM1/URVTap9GiDb+RgSifBqI+U
 mLiAzNoUvXF0xf3gGG7ROeJF5cKh1fk2LVDa79Jx/qmweuxfinmXKNnHRvGTO9rXoFR7
 HrE6RW6jJQe21TX1uInTMmEr9simCZQz4QSdy/9OS9RV2LPO6RX7oi3J5V2NRRkytEeX
 PkilmM8G31jeY/ahrk5NrQYsmV0X0yemkeVr7nR+Y4agnQZ+Pg8YhR0FHkxj26KKN9sP
 k7GA==
X-Gm-Message-State: AOAM530eW3SHs5TPSOsVqy8aeMd6qPZm7hUcptESJ7RP4+owr0GWn2zh
 N+AzF/ZWmIoX8daYjwPxR9va8Q==
X-Google-Smtp-Source: ABdhPJwRDRbTHJk3HEmcbQfYFI80PrRBsWPFQPQWqVipYfyKULWwB34Zhr0l/Glpq7ooZxtpbrkayg==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr25516046wmd.110.1614092565006; 
 Tue, 23 Feb 2021 07:02:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm3027300wma.4.2021.02.23.07.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 07:02:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 149021FF7E;
 Tue, 23 Feb 2021 15:02:43 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com> <87im6i4znx.fsf@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 15:01:50 +0000
In-reply-to: <87im6i4znx.fsf@linaro.org>
Message-ID: <87ft1m4yjw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan
 Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Cleber Rosa <crosa@redhat.com> writes:
>
>> To run basic jobs on custom runners, the environment needs to be
>> properly set up.  The most common requirement is having the right
>> packages installed.
>>
<snip>
>
> So I got somewhat there with a direct command line invocation:
>
>   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/se=
tup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/python3'
>
> although for some reason a single host -i fails...
>
>> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/b=
uild-environment.yml
>> new file mode 100644
>> index 0000000000..0197e0a48b
>> --- /dev/null
>> +++ b/scripts/ci/setup/build-environment.yml
>> @@ -0,0 +1,76 @@
>> +---
>> +- name: Installation of basic packages to build QEMU
>> +  hosts: all
>> +  tasks:
>> +    - name: Update apt cache
>> +      apt:
>> +        update_cache: yes
>> +      when:
>> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>
> So are we limiting to Ubuntu here rather than say a Debian base?

Also I'm getting:

  TASK [Update apt cache] *************************************************=
***************************************************************************=
*************************
  fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional check=
 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: err=
or while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ubun=
tu'): 'dict object' has no attribute 'distribution'\n\nThe error appears to=
 have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.=
yml': line 5, column 7, but may\nbe elsewhere in the file depending on the =
exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n   =
 - name: Update apt cache\n      ^ here\n"}

which is odd given that machine is definitely an Ubuntu one.

--=20
Alex Benn=C3=A9e

