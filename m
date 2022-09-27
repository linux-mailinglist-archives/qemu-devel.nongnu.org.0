Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1785EBE02
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:08:08 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6ZT-0004rw-8A
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od5r1-0008Gs-Ie
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od5qz-0000lx-Ox
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MLqQZ+7PSZN58OTodD562PnWI5elhFrOF+nHccsB9Pk=;
 b=Dt0+JMIOB/vOW0J0D+K3TzM/EmGeDe08L65DA61ZnT0cVwiYVeWWIDDHri4r/fTOyQVoCb
 PHBVxEG6GkiyzOpF6luo/OUd8oNyaKiToA3774GoF1WNQrjVuDNXoLJjZmzhUiilc9u0ku
 jx9TCKbtVXjZN7o1VXNxUVyranB2h+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-vyQXZv4PMfKItockPWEhxQ-1; Tue, 27 Sep 2022 04:22:07 -0400
X-MC-Unique: vyQXZv4PMfKItockPWEhxQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r7-20020a1c4407000000b003b3f017f259so5211283wma.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=MLqQZ+7PSZN58OTodD562PnWI5elhFrOF+nHccsB9Pk=;
 b=ELUX6/Ub0zdT9/JfENeYbEf+Akq/qD/cgcqwxySeviGSaMO/TJ9fjstTxP82wavq6b
 FxHtNdGA8730PlCGoddAoRZ7xtnJe4jbCwnZiJ7/WAjyyo0BuO1YfYMapJALGahDfcrA
 2z+Z63xx2LWtbQhjAdFH5oyWxO8TbIzuBZMJDWaEj5W5BA+HB2hOfYdwa7EGOMyCFRME
 onOaBP2SKBGU9IGUxn7+moM0TqT+aYzrAVu1wUGSUAc48NijCQSPbK/hNYYdsz4H1V5e
 sDLXCgpJmjxrSqxigk7FcDMz5DHvzj9ps7IC+S7JIndzZW3QhX5HV7KoV/AgFLHbrnMh
 QE+g==
X-Gm-Message-State: ACrzQf2PcO57EbvuVMENQw9Sk03cniGzEksPdPT5UsieDjsQ53i0nYwC
 6S7r2g1HVJ5Ju3N8J4gy+Tmq6p+tCwCK94XoodNZFQj2ehcq9onrCWakNTMT8dMggItgXISYgex
 3zfOl00OvlSIF8mkrSOGtOuzzInAVxQK6O96LaTO9ma7UbPDVmjRgmzA9gotyOIo=
X-Received: by 2002:a5d:5849:0:b0:22b:a0e:11e0 with SMTP id
 i9-20020a5d5849000000b0022b0a0e11e0mr16633516wrf.72.1664266926672; 
 Tue, 27 Sep 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PNpbbqmTBq7vqe39uAFLrjW74qKyRFewa4KCvFBGfAXOvzgXKY0VK7XzGrz+RhNX6te7ttA==
X-Received: by 2002:a5d:5849:0:b0:22b:a0e:11e0 with SMTP id
 i9-20020a5d5849000000b0022b0a0e11e0mr16633491wrf.72.1664266926385; 
 Tue, 27 Sep 2022 01:22:06 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 y18-20020adfe6d2000000b0022af63bb6f2sm1051341wrm.113.2022.09.27.01.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 01:22:05 -0700 (PDT)
Message-ID: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
Date: Tue, 27 Sep 2022 10:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Should we maybe move Cirrus-CI jobs away from Gitlab again?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


  Hi all,

now that Gitlab is giving us pressure on the amount of free CI minutes, I 
wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI 
dashboard again? We could add the jobs to our .cirrus-ci.yml file instead, 
like we did it in former times...

Big advantage would be of course that the time for those jobs would not 
count in the Gitlab-CI minutes anymore. Disadvantage is of course that they 
do not show up in the gitlab-CI dashboard anymore, so there is no more 
e-mail notification about failed jobs, and you have to push to github, too, 
and finally check the results manually on cirrus-ci.com ...

Opinions?

  Thomas


