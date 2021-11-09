Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12F44AAB4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:41:27 +0100 (CET)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNd8-000635-Q3
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:41:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNba-000538-8D
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNbX-0002p5-M9
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636450787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ON4iYSKFB7Ofnu6MfmmLtGAMi+seJtc6z0qWxcZe/oE=;
 b=Li6nZBzIiWsMPTs/vrR6EOrPk/LsYMefQTTmFnfGVUXHvs1KS6OrxF7zA0W60RJWQupQCT
 OUkaYZxSkzbNNccOj6jCgfgl/m62bG+Qj7TSuxrcO9gwR+7f7SeBXR0jrCU7s71Vx6ZF6D
 t/gxItZT91+TO0jwb5ScZ2GabnraJGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-CYlsjuu1MbORIJTF8LT2Sg-1; Tue, 09 Nov 2021 04:39:45 -0500
X-MC-Unique: CYlsjuu1MbORIJTF8LT2Sg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so358830wme.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 01:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=ON4iYSKFB7Ofnu6MfmmLtGAMi+seJtc6z0qWxcZe/oE=;
 b=L/9ErYkG0iwxtPkqfDlvWq5Vt7LMFhds/1Jj4oYOJx6fbIfGRgD2hnI5V5WhbHHOwI
 pfnhpCV+OOTtrjv8LeGFd4P6vMehA975yDUzwElncXhbuqBQ10kjg6iyjBAUy6FTLEJb
 BrB61ouH4efSYAmVlsafsF8g2eIdGKOCjnM1b2gioqvi5tadwgacBPT5XHB58Ok51U50
 sL8mMhqA10NKSCfKTrf5qHIcZsSSUqzR4B57MOZkYmuXkh4KelNp13QLLbj36UqWuas4
 WUyT45z/bxaYXNvaVzLBieXR6qDVRENRoMZs+7xjNxvX3GJVkg4BjmEUeQLTfX+bIamy
 FPbA==
X-Gm-Message-State: AOAM533z+ENXH1+65kuQ2F4fDzLAkWhO3vVc1P/CGw0n13hrkI5BhyZt
 BK8buZuDD+16qtt5sxgw1AR2KDBLsnvj28fpepyD3+LvVzy+YDzCS/+D8/g26O/Mvlg+X4oe2HH
 Sx7Uxk0CucHvBHHk=
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr5915544wms.12.1636450784270; 
 Tue, 09 Nov 2021 01:39:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6Z9V7+SK/VAGh+iY/mSgP2C2pjvxK/LFxpbKrrCAbKii9KDN7zCxchdhfZN9eqlbelIuFzA==
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr5915532wms.12.1636450784140; 
 Tue, 09 Nov 2021 01:39:44 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z5sm2614074wmp.26.2021.11.09.01.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:39:43 -0800 (PST)
Message-ID: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
Date: Tue, 9 Nov 2021 10:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Cirrus-CI all red
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI, as of today, the latest merge history is red (last 10 days):
https://cirrus-ci.com/github/qemu/qemu

If we want to keep using this, we should somehow plug it to
GitLab-CI (i.e. Travis-CI is run as an external job there) so
the project maintainer can notice job failures.

Alternatively the windows job could be passed to GitLab:
https://docs.gitlab.com/ee/ci/runners/runner_cloud/windows_runner_cloud.html

Regards,

Phil.


