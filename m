Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9BA49AE98
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:54:06 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHaX-0007Rj-FI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHXj-0005yp-HG
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHXe-0007MY-U0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643100665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jlHzmF33820k/THzTTywIQDKjzQH4pmKS1BpZDTYLs=;
 b=Bprf9DM9hZ7pkVr8U+f3aDTtNO0MmK6KZ/35dN+m+Nk9I1jba9oNWckHNVCydV6TLqeDGh
 6R56cp+EwxlUx83F/mJRoRqvjsdaGEx00ATwTQs6lPeJa5jaiVmGICUdJBn/plGsG8fudf
 fn5Hd9hpXGqcqyPldRPESJmJH2mc2wo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-q-uw8kjmOdKCqOUN91H8EQ-1; Tue, 25 Jan 2022 03:51:04 -0500
X-MC-Unique: q-uw8kjmOdKCqOUN91H8EQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so844839wme.9
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 00:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jlHzmF33820k/THzTTywIQDKjzQH4pmKS1BpZDTYLs=;
 b=t3D+518Bh8r4M2yA2jz0IWERzUpfcuT3KMXV/wjgwt4ffkzXB/bZSgD11lUHFjnIc/
 b8QE+it9kryDDZl3T5Iaq6ZSQX/KS38BTM7ymcSujKBn+7fipeGhrLbo9yHxEeasu2yp
 Qvz1MM97EmndxIw5WZa2pAwh4CJN/HrT1uwecsSyMuEWsOVaezUhSKe5heXAeNDIPWE/
 9/sdBnZZ76LtijIOYeAMdBNIyJVT72JNIHGnMa92UrQa8XOIR95Lih6vTE7UN7SA/kWw
 T0t+KJl+9nCvYG9p9rA6p7luINrqhu7f57yNsIaTYrI2fXCtkMRAR9U8sVAjNZPuZp1O
 sc0A==
X-Gm-Message-State: AOAM5316OOwa3AsKs1tYYWFhtJANCWfCNroVGob0c5s/ithNTA8fXvD6
 SULSdQwmVAJ4HMkp7oAhm8fA6EZyXRJiuKXUM65426Dsw1n02AXzDbZ3vlxio9Vv2RrdojViePb
 1/WSBOQOAXbhXiws=
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr1913045wmb.128.1643100661359; 
 Tue, 25 Jan 2022 00:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyXx9d3m913ilqShLQN6L/JWv7T/Qz4iYROLdgJWH2empUQ3Vwys60UaJnlOmy0CNfSl+Dfg==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr1913011wmb.128.1643100661040; 
 Tue, 25 Jan 2022 00:51:01 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id t18sm1707763wmq.43.2022.01.25.00.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 00:51:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
In-Reply-To: <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com> (Mark
 Burton's message of "Sun, 23 Jan 2022 21:49:19 +0100")
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
 <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 09:50:58 +0100
Message-ID: <87h79sw64t.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Burton <mark.burton@greensocs.com> wrote:
> All, I believe we will have a followup meeting this coming Tuesday
> 25th January, at 15:00 (presumably using the same link:
> https://redhat.bluejeans.com/5402697718).
>
> We (GreenSocs/Xilinx) would like to quickly show what now =E2=80=98works=
=E2=80=99, and to give an update on the patches.

I send the call for agenda already.

We are having the meeting.

If you can add anything to my [very] incomplete minutes for last meeting
that I sent with the new invite, it would be great.

Later, Juan.


