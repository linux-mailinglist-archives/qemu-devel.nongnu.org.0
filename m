Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B864F3E1436
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:55:26 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBby9-0005ah-Qx
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBbwm-0003aL-RE
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:54:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBbwl-00049d-59
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:54:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id d8so6174057wrm.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=GsXS5G8kYqFd+2n2aBk2b+A/dqqFTt7hSB9YsfgvZ6fAI6zcEhTqwAP0LfGOW8C4r5
 zaytLk/CNnXWLytFpQ6/8EHPssBnLabGrOzjunpFa45jqEAxH0m7LJRhpkAAbp59j+pX
 MVI6FcrQ5RzxZ3H1S7xZb1xXwB5MgZRdLfHs6yq9z+06ks3KSGB+Z10N1zYJZ6o+NM/O
 QUTRiVp4h/1c0jkGtb34OiNv6zwFZZxCJFwIoSHdx4XlCzdThO9jNAqe/c+IxWJZa1eW
 26kacXMqYgqYySzHlQfoidynyKFqLaY7Hr4xVGyys9MHoI8zCcGKDUDk9Vj5t+7qcX91
 JW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=l8S7IMdc4SUhiw5I4pOV8PMvaReZnbbuWwyyj8foNcE=;
 b=sbf5PH5k8smxx3f+g+7zBRmyxHPsErh6NHxTPzvFj4LZJdQUCRw9b3cp0fgxXVG5EF
 9OrzpzJDLlAE5jXAn+UNJtCyGx0MMDKq9lBhwV5sifLbaiApkbFNSLExxrcS1pL+0RC1
 722TT0j45CZaji0uoJ5+iqwiUBYBj2jBeljBTlFXnhRtqNJpHobzQ8Td4SH8D4Eer703
 q3bo2Sx4mmiw9R+vL1Kranucp15rr/cLkpuDCCHDv+cxhNAqcZ063VDiGe+ZhlEHk8wO
 MuPi86DXadwHHbtBP85peSdWdLQ5ahIZJneH/Wstk8XOZQiX82EEGJR2FPqVi+pmg5mt
 v6NA==
X-Gm-Message-State: AOAM5312Nw1mp6JJ4eHJylb178RIvdCs/t0IUBtEAeK2xFK1MJlrWFqM
 2GgayPVLbS5W8Aoe/rT24Rf6gg==
X-Google-Smtp-Source: ABdhPJwgpwPgDRobqy5loVBSZBb1VxFkwVhHGvVYlf7KOxtbH+1gcedAlIELKPR4zr9uVEj4awv82A==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr4894928wrw.72.1628164437489;
 Thu, 05 Aug 2021 04:53:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n186sm10554974wme.40.2021.08.05.04.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:53:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 095101FF96;
 Thu,  5 Aug 2021 12:53:56 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-3-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] docs/devel: create "Developing QEMU" subsection
Date: Thu, 05 Aug 2021 12:53:51 +0100
In-reply-to: <20210804005621.1577302-3-jsnow@redhat.com>
Message-ID: <87im0kksyz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

