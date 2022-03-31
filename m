Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD54ED77C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:03:26 +0200 (CEST)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZreG-0008Om-NQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:03:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZraz-0006iK-D9
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:00:01 -0400
Received: from [2a00:1450:4864:20::534] (port=40927
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZrax-0002RA-O9
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:00:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id y10so27509940edv.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=g0/w5CwzVXonk6eBQ2vH6z9ALOIA62jTO4czv9IcWWo=;
 b=FzT01WbtW6ljYe2+HCftCwc0GIdF+i8eSraTVNvEBTOgbvZIs7RXc3ECB452xw0W95
 0I/gDcD10FBv4pgW9RmodlQ05uL9aaCxCaltswGwCqjBbGIfYMA0h0LySrj3AYktc2H7
 +Oip55yXbsmJfJDMaARaRka38klpFkbxiN9fHLGNNyXlAJ6CRQ7UNolG/4HhBUWAHrWY
 b2oFv5NO/2yO7Giv2cyy1CCpIve9sI58Jfgnz28VnkMiU7h10sIv0HvTPBFIAQEsnuVm
 AYkbas8h/mTcph4JAOPgkRPSQb0x7DlnYbzdV7on+eEDxyH8hw8Y+DvcuLgyWjnfha1t
 vAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=g0/w5CwzVXonk6eBQ2vH6z9ALOIA62jTO4czv9IcWWo=;
 b=J7cCFdfF2O6MUr0kSr2wYXguCngQ2ioOA97p5qvhRzKN+/ZSeYwWLdC/2s7HEMGUny
 bjsUcNyh+TpsMCAdr7lmoFay3dGSSrn8Y+CjW9vTs9lg/pfzw9Z39Bt3LCi4ktwLATfR
 wx18y5ZNAvkjmIkQ77QeV0THXyio/FXUNjoc7sf/irHv0wdZa+5jrzlusnosJBP3cnNo
 F7fkO12dD9SiT6OnPugEzUnajJBzpDxAcCvJuT1ynCO9hJJs4I7sbPX1rr2OYHg8W50r
 9m/RnTEGmkkLw71+7VUjcwY9fqtSVGCLEPbrixs9fRvXB/fuPm5WbiEsAUBxtzZzd+sV
 Fhjw==
X-Gm-Message-State: AOAM531Z8drXCl5Y+/wgfNCJT/Wxt5X1oPYaVaFr6bZymw0mIfYGWTqs
 ai8/hAh1J9OK7zno8vDPvduZkg==
X-Google-Smtp-Source: ABdhPJypY0ORKkYLbjLe2lYBdxau3kv6p8ZzzxEr8wKNUDVwNblb3aoASCbGtQd2b/yTUwNIazBxMQ==
X-Received: by 2002:a05:6402:1909:b0:418:d876:3119 with SMTP id
 e9-20020a056402190900b00418d8763119mr16096971edz.266.1648720798287; 
 Thu, 31 Mar 2022 02:59:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 jg39-20020a170907972700b006e047c810dbsm9252083ejc.56.2022.03.31.02.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 02:59:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C1D11FFB7;
 Thu, 31 Mar 2022 10:59:56 +0100 (BST)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220204072104-mutt-send-email-mst@kernel.org>
 <874k5espp1.fsf@linaro.org>
 <20220204090512-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Thu, 31 Mar 2022 10:58:18 +0100
In-reply-to: <20220204090512-mutt-send-email-mst@kernel.org>
Message-ID: <87mth6wig3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@rehat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Feb 04, 2022 at 01:52:47PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
>> >> Hello,
>> >>=20
>> >> This patchset adds vhost-user-gpio device's support in Qemu. The supp=
ort for the
>> >> same has already been added to virtio specification and Linux Kernel.
>> >>=20
>> >> A Rust based backend is also in progress and is tested against this p=
atchset:
>> >>=20
>> >> https://github.com/rust-vmm/vhost-device/pull/76
>> >
>> > So I'm waiting for v2 of this, right?
>>=20
>> If you can give any pointers for how to properly instantiate the stub in
>> qtest then we can spin v2 pretty quickly. I tried but it didn't work:
>>=20
>>   Subject: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-g=
pio (!working)
>>   Date: Fri, 21 Jan 2022 15:15:34 +0000
>>   Message-Id: <20220121151534.3654562-1-alex.bennee@linaro.org>
>>   X-Mailer: git-send-email 2.30.2
>>   In-Reply-To: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
>>   References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
>>=20
>> it's all a bit opaque as to why it didn't.
>
> A bit rushed short term, it this isn't resolved soon I'll try to help.
> Maybe try CC other vhost-user maintainers (for blk,gpu etc) meanwhile.

I have expanded the CC list for this thread and the RFC patch to see if
anyone has pointers. I'll pull this series into my vhost cleanups series
for post 7.0.

--=20
Alex Benn=C3=A9e

