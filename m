Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847A4E58E6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 20:06:45 +0100 (CET)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX6Jf-0007kv-Ut
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 15:06:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX6IB-0006zF-P0
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 15:05:15 -0400
Received: from [2a00:1450:4864:20::62a] (port=46595
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX6I9-0008Dd-5r
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 15:05:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id qx21so4731659ejb.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Tae71RGe+fh0Ov4UK2RctqokSFvBA6nwM22GTqzv8Fk=;
 b=jUNjVogYnEJXTrw1R69IX0rawnTZh4VHs3xC6+DoIVgwvGu7Gq6d0SDVLPtkeFdJnn
 0AjbmLFGM/2Cs1g5UprYxxtfiA+HoCeG2R/VtfOjcbNP2XWskVuwadbi3n1lj7L1hXtu
 KVqXcIpsaPNJ+8dk/m+l62g9HuBGoEcTTCW62Cip92tYS7B03CU9a7MD4HD+UEO6+5u9
 ogwYltVW2NZo+TOhEKN9revGM+jBlFj8MMtn2sM+9EfxOiZc26z6kbFf6fbqjVPdwhhl
 2/7bzdj31hZFyGdNIlYBnjfXkv8jZNbxhG9yQ2fJbnZyR9SsRz+Y/q59afGjTDh1p2Up
 DxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Tae71RGe+fh0Ov4UK2RctqokSFvBA6nwM22GTqzv8Fk=;
 b=dsyn+pgW1MQsdIZlR9ojg4DO/PNdSk/1UpiUPcaVXdFpfK7xWkT2y7G0lTNBvqhW6A
 E07KPl8qH/020EN0P/bn9QjKlwkiRf/NDVCBhav1mE6/GSsuADSm2r9NKNEDxZpmH5TV
 TeSmamh54bTETXBv08+rrpI7lSlYp1nJsQVafZ+lSyVvrxZaSl6/7WZNr4um3/n01QkM
 WtZ1UC6RuyqAqju2XotB7JaCExTiKjg0rHrZ27T4oJimwzmYpyCJapwKJISL/VGz1rTK
 SchKA+8pdhf1rnSwIHMkEoIyZvxYpXrO52lBE7Uhtje6h8jew8MV4Za1yU0EqRHOlkIo
 JQXg==
X-Gm-Message-State: AOAM5319Ikg4dcRqqIWWhBvxK/a/4wZusQet6IELM7Dn0hBbhAcYzrJh
 Qa3tLPh7W2zuBvc1QVYY61IkKFKfvEcZGw==
X-Google-Smtp-Source: ABdhPJzRGePr2s3RxUMSzBSlx9rm8ubUV0Rf6OCD4qOTWHqf2+j0vlFdTHk2b9tWbhr1GezpWfnenQ==
X-Received: by 2002:a17:906:9746:b0:6e0:5c9a:1a20 with SMTP id
 o6-20020a170906974600b006e05c9a1a20mr1732625ejy.714.1648062301988; 
 Wed, 23 Mar 2022 12:05:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm266246ejc.158.2022.03.23.12.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 12:05:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B759A1FFB7;
 Wed, 23 Mar 2022 19:04:59 +0000 (GMT)
References: <20220323112711.440376-1-alex.bennee@linaro.org>
 <CAFEAcA-Eua8V0L1bKRf1C5F7-cVyfcJ+EEnidaj90L+E86FHJg@mail.gmail.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for 7.0 0/8] i386, docs, gitlab fixes
Date: Wed, 23 Mar 2022 19:04:04 +0000
In-reply-to: <CAFEAcA-Eua8V0L1bKRf1C5F7-cVyfcJ+EEnidaj90L+E86FHJg@mail.gmail.com>
Message-ID: <871qys4hic.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Mar 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb=
30b:
>>
>>   Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.0-230322-1
>>
>> for you to fetch changes up to 0f37cf2f71f764c5649e149c774172df7ab187c7:
>>
>>   docs/tcg-plugins: document QEMU_PLUGIN behaviour (2022-03-23 10:38:09 =
+0000)
>>
>> ----------------------------------------------------------------
>> Various fixes for 7.0
>>
>>   - make clean also cleans tcg tests
>>   - fix rounding error in i386 fildl[l]
>>   - more clean-ups to gitdm/mailmap metadata
>>   - apply some organisation to docs/devel
>>   - clean-up semihosting argv handling
>>   - add custom runner for aarch32
>>   - remove old qemu_logo.pdf
>>   - document QEMU_PLUGIN env var
>>
>> ----------------------------------------------------------------
>
> Is there anything in here that would affect s390 host? The
> s390 job seems to be consistently timing out, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/2241445160
> but I have a feeling this is a pre-existing intermittent
> hang on that host...

Nope - but I can see the tasks that are locked up:

2769105 gitlab-ru  20   0 11816  8092  2112 S  0.0  0.0  0:00.03 =E2=94=82 =
 =E2=94=94=E2=94=80 make --output-sync -j4 check V=3D1=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
2769521 gitlab-ru  20   0  533M  168M  8964 S  0.0  1.0  0:22.79 =E2=94=82 =
    =E2=94=94=E2=94=80 /usr/bin/python3 -B /home/gitlab-runner/builds/-LCfc=
J2T/0/qemu-project/qemu/meson/meson.py test --n
2771499 gitlab-ru  20   0  533M  168M  8964 S  0.0  1.0  0:00.00 =E2=94=82 =
       =E2=94=9C=E2=94=80 /usr/bin/python3 -B /home/gitlab-runner/builds/-L=
CfcJ2T/0/qemu-project/qemu/meson/meson.py test=20
2771497 gitlab-ru  20   0 78740  3284  2924 S 10.5  0.0  9:44.54 =E2=94=82 =
       =E2=94=94=E2=94=80 /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-projec=
t/qemu/build/tests/qtest/migration-test --tap -
2773014 gitlab-ru  20   0 1762M 54716 36780 S  0.0  0.3  0:00.31 =E2=94=82 =
          =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp/qtest-2771=
497.sock -qtest-log /dev/null -chardev socket,p
2773019 gitlab-ru  20   0 1762M 54716 36780 S  0.0  0.3  0:00.00 =E2=94=82 =
          =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2773018 gitlab-ru  20   0 1762M 54716 36780 S  0.0  0.3  0:00.00 =E2=94=82 =
          =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2773017 gitlab-ru  20   0 1762M 54716 36780 S  0.0  0.3  0:00.00 =E2=94=82 =
          =E2=94=82  =E2=94=94=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2772869 gitlab-ru  20   0     0     0     0 Z  0.0  0.0  0:00.11 =E2=94=82 =
          =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp/qtest-2771=
497.sock -qtest-log /dev/null -chardev socket,p
2772862 gitlab-ru  20   0 2987M  162M 36972 S 107.  1.0  1h44:46 =E2=94=82 =
          =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp/qtest-2771=
497.sock -qtest-log /dev/null -chardev socket,p
2772915 gitlab-ru  20   0 2987M  162M 36972 S  0.0  1.0  0:00.01 =E2=94=82 =
          =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2772867 gitlab-ru  20   0 2987M  162M 36972 R 99.6  1.0  1h37:41 =E2=94=82 =
          =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2772866 gitlab-ru  20   0 2987M  162M 36972 S  4.2  1.0  4:18.71 =E2=94=82 =
          =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2772864 gitlab-ru  20   0 2987M  162M 36972 S  0.0  1.0  0:00.00 =E2=94=82 =
          =E2=94=82  =E2=94=94=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp=
/qtest-2771497.sock -qtest-log /dev/null -chardev socke
2771498 gitlab-ru  20   0 78740  3284  2924 S  0.0  0.0  0:00.00 =E2=94=82 =
          =E2=94=94=E2=94=80 /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-pro=
ject/qemu/build/tests/qtest/migration-test --ta
2646940 gitlab-ru  20   0  7152  2556  1852 S  0.0  0.0  0:00.00 =E2=94=9C=
=E2=94=80 bash --login=20=20=20=20=20=20=20
2691489 gitlab-ru  20   0 11820  7896  1912 S  0.0  0.0  0:00.04 =E2=94=82 =
 =E2=94=94=E2=94=80 make --output-sync -j4 check V=3D1
2691914 gitlab-ru  20   0  533M  167M  8720 S  0.0  1.0  0:22.20 =E2=94=82 =
    =E2=94=94=E2=94=80 /usr/bin/python3 -B /home/gitlab-runner/builds/-LCfc=
J2T/0/qemu-project/qemu/meson/meson.py test --n2706323 gitlab-ru  20   0  5=
33M  167M  8720 S  0.0  1.0  0:00.00 =E2=94=82        =E2=94=9C=E2=94=80 /u=
sr/bin/python3 -B /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/m=
eson/meson.py test 2706321 gitlab-ru  20   0 78944  3500  2924 S 48.9  0.0 =
 1h30:10 =E2=94=82        =E2=94=94=E2=94=80 /home/gitlab-runner/builds/-LC=
fcJ2T/0/qemu-project/qemu/build/tests/qtest/virtio-net-failover --2706783 g=
itlab-ru  20   0  695M 55164 36636 S 34.6  0.3  1h04:59 =E2=94=82          =
 =E2=94=9C=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp/qtest-2706321.sock =
-qtest-log /dev/null -chardev socket,p2706797 gitlab-ru  20   0  695M 55164=
 36636 S  0.0  0.3  0:00.00 =E2=94=82           =E2=94=82  =E2=94=9C=E2=94=
=80 ./qemu-system-i386 -qtest unix:/tmp/qtest-2706321.sock -qtest-log /dev/=
null -chardev socke2706796 gitlab-ru  20   0  695M 55164 36636 R 22.4  0.3 =
41:24.24 =E2=94=82           =E2=94=82  =E2=94=9C=E2=94=80 ./qemu-system-i3=
86 -qtest unix:/tmp/qtest-2706321.sock -qtest-log /dev/null -chardev socke2=
706795 gitlab-ru  20   0  695M 55164 36636 S  0.0  0.3  0:00.00 =E2=94=82  =
         =E2=94=82  =E2=94=94=E2=94=80 ./qemu-system-i386 -qtest unix:/tmp/=
qtest-2706321.sock -qtest-log /dev/null -chardev socke2706322 gitlab-ru  20=
   0 78944  3500  2924 S  0.0  0.0  0:00.00 =E2=94=82           =E2=94=94=
=E2=94=80 /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tes=
ts/qtest/virtio-net-failover

>
> -- PMM


--=20
Alex Benn=C3=A9e

