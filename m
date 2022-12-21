Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61A653475
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 17:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Oh-0001JF-Oa; Wed, 21 Dec 2022 11:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p82Of-0001Id-7C
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:56:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p82Oc-0007b2-Po
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:56:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so15507904wrz.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 08:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBC7OohFEBhiOOGGerB2fvSXU2d2ua4Xdr8vWHO1+iU=;
 b=EKcx0mFxbErqVm2er1lY5OErmZuwX6lviJQjy0uhShpTj0XNw4T7uMBIet3s6zqYgQ
 qpbsxxmc2W5vx25fK0rLxB7Ppzgg1OZUWmboqCR6NrrEIdq1msFQxtkSqubZOMDzOmuA
 N3f1Hddv/73ZxfSfu3S3TtQBjx5FaoxDBnDOyK/mheCPq7U+3rOH1bi55EzRlFWf6ly1
 1fz/V4sjb2S+XevL3zY4HesUIDHCRwB1pf5nsjtUCqpW079mqo8orV9EM293+RBpMJLe
 Dm+STBCmcVpyWll60Jarn7VY0NxM/fde8c8VDfdFm18TnIjq5f+Rw/JFO2zGziVhXZRR
 WkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iBC7OohFEBhiOOGGerB2fvSXU2d2ua4Xdr8vWHO1+iU=;
 b=i1PWk5MpezodP5NEKHH+IqQfYRYaPxrHcpzOM5ZYb4Krb0PSE00HMwbCZhPs0JK57M
 oy0YI86lx9pDuS8c62IqB/1EbOPiLZG1GD+6qVldGZz9ovBIDeE/rawM0LC8Sen3tTf8
 Ws0X+pztVQTqHMWfpI7SocmG03vtrFIS4L0ZxTfbTSjXshB7twe2uEkd13VrNKE04MOP
 508UuIRrkPs1YJdORDnJEe7Wzcdb3UnTAMxrcIPgpel2bkQsKmsVVDlodNdTLZFSdT67
 eQjlgS4POY/6Z+IWd2hC8nINw0HwlJt5hYzUrFSxnPPpTaNdDKb5UgN/UFuDK/WSu2dM
 wKYw==
X-Gm-Message-State: AFqh2kpC8mAyii94p8QkIgpxfRQ4sN09NsgAt9OlYPdQPtlIz1wrwl9W
 fxBphe+72/YHNjIGqu7ubLnsLWePW85YheqL
X-Google-Smtp-Source: AMrXdXs8UjhKio94xSGx8n3aVxy+XiV7GTW1Z1TFbwKJ9Qv0082Q7Rt9mkgmAWUd1GVfYWAUV8mFKg==
X-Received: by 2002:a05:6000:695:b0:260:6b09:fa0e with SMTP id
 bo21-20020a056000069500b002606b09fa0emr1741291wrb.31.1671641805445; 
 Wed, 21 Dec 2022 08:56:45 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d4412000000b00235da296623sm15937551wrq.31.2022.12.21.08.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 08:56:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9968C1FFB7;
 Wed, 21 Dec 2022 16:56:44 +0000 (GMT)
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-5-alex.bennee@linaro.org> <87sfhfgydw.fsf@suse.de>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v1 04/10] gdbstub: split GDBConnection from main structure
Date: Wed, 21 Dec 2022 16:56:08 +0000
In-reply-to: <87sfhfgydw.fsf@suse.de>
Message-ID: <87len0y9tf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Fabiano Rosas <farosas@suse.de> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> In preparation for moving user/softmmu specific bits from the main
>> gdbstub file we need to separate the connection details to what will
>> eventually become an anonymous pointer.
<snip>
>> +
>> +    /*
>> +     * The following is differs depending on USER/SOFTMMU, we just
>> +     * hid it in the typedef.
>> +     */
>> +    gdbserver_state.connection =3D g_new(GDBConnection, 1);
>
> Does it need freeing at reset_gdbserver_state()?

Following Richard's suggestion I'll move to having separate static
structures instead to sidestep that problem.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

