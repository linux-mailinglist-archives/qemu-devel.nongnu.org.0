Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F76F5478
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:19:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8dM-0005f3-1t; Wed, 03 May 2023 05:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8cy-0005Ex-6H
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8cv-0000XM-VG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIjDyuhTWku71Kk+hAMJGF/L0dw8BvkhgAvVF7z8FvA=;
 b=Bgt+OqXHW+Q78SftKi9qmnD6Pv9pUfSkbcG1/y+HHcjEgN6j5KqMjutJL9HAETWQTlOdRl
 fgO/62hVa8yNbW4dcu2WRv0QVuhudp6YPhq+HiXaCeThPQHHk2YlMgC6nYiP6Mm98fHCt/
 8LPxem7oVfGGEZ29FkBNrTq/frF5jfE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-_6sVjfpfP-Wq2YLtlSikbQ-1; Wed, 03 May 2023 05:18:20 -0400
X-MC-Unique: _6sVjfpfP-Wq2YLtlSikbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f336ecf58cso13123355e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105499; x=1685697499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JIjDyuhTWku71Kk+hAMJGF/L0dw8BvkhgAvVF7z8FvA=;
 b=htDnNa1f6mNgmFClLel+A9Ha1RmGo9Fy4lechyG3ZgWXKI6btcFJBce0x4LYmQPTTh
 g78ngZ4karSa4rbH9pTuETH2NN5OYoKvupGuH3G8T75UBFRx6gR2p/UmNPA9x3TqVsTE
 bwUOvqKlv5bgfYTzRmVOFnYIyh/BfjIRBD4Hshr+ce+Ll880Fi0Zbr07ei4hJnyQFXcz
 2mjE6T6SnCQEHiRlqyUdVUd5dTmS0KbLW6qtWxmC9YRjwX5AsZ57zSpBL/kbxJLEvLI2
 kUyDGULxRFxGEKqSQ4YjTIex8Z5qXUhg0++9m6Zu6lGx4qaHal4h1a+pT3O+NFNuH//z
 84Nw==
X-Gm-Message-State: AC+VfDybZ+c08PpqMxMtvGyhmsiCcrbtxhxSW4DIt9gSAebjwVHB0PCG
 91xfm9HzD3iHgpH8tNzivF2HGhIx6mb8X5IN2r/Gp42hM72xMp91EnNVjszrnpiGe2h8MvYFsqC
 6WqxRjE1F2OmUOwA=
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id
 h19-20020a1ccc13000000b003f3468ca783mr3385224wmb.8.1683105499161; 
 Wed, 03 May 2023 02:18:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lrqPyY0T6z8z94NsOET83t4pqJ4EDtvdBPNq+EhhQ+kxdYhQol1dqYCnOqf8goA4KP7DPqg==
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id
 h19-20020a1ccc13000000b003f3468ca783mr3385178wmb.8.1683105498811; 
 Wed, 03 May 2023 02:18:18 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003f31cb7a203sm1289347wmc.14.2023.05.03.02.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:18:18 -0700 (PDT)
Message-ID: <93477153-dc6e-4e37-5ff4-f771551b5ac9@redhat.com>
Date: Wed, 3 May 2023 11:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/22] gitlab/cirrus: reduce scope of the FreeBSD testing
 matrix
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03/05/2023 11.12, Alex Bennée wrote:
> While the Cirrus build machines are quite beefy it looks like we are
> still hitting timeouts. Lets reduce the testing matrix like we do for
> the other BSDs to see if this brings us under the line. This is
> however a pretty restricted set and I'm sure there are stalls
> happening on FreeBSD which should be addresses.

My fix/workaround for the hanging FreeBSD job has been merged yesterday:

  https://gitlab.com/qemu-project/qemu/-/commit/01013d2c10a07bb49d

It seems like the test now finishes again in 23 minutes:

  https://cirrus-ci.com/task/5409701572116480

... so I hope you can drop this patch here now from your queue.

  Thomas


