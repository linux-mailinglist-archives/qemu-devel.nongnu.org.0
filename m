Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9647F031
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 17:40:52 +0100 (CET)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ncg-0005vU-Hr
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 11:40:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n0naS-0004bD-Gz
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 11:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n0naO-0005O5-O1
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 11:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640363907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiQIjiYYqHFGojEL8cneti6wYtOF0LZP6Z+ft/s5QVo=;
 b=fAlSuswPc+l5lpgzH2KMpDJ4CKWiiY+ogPRF0+egQbLFFSnmdcyXyKRn2Ca6qGAsGjJoH9
 CKLNYy5tsrUq0hoKDOE+uN3aNh0qii7hv2F5CHNVlQxKtYB0V7R12ogl6EZsqdqNQP5hX7
 hMhwz1F0hTHywQkznIfSLrdBuOOXblw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-a84-cehxP3u3o0q1gjNi-w-1; Fri, 24 Dec 2021 11:38:25 -0500
X-MC-Unique: a84-cehxP3u3o0q1gjNi-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a05600c1d9600b00345a25ea8cfso3364307wms.5
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 08:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Aocaj87g0NM0zkDKZ6QjtgjKlG7BOebgSuZiK3+Izc=;
 b=cPn/YAL08xjeVKU6uMrkp4WxtYA6s9qJYkgkeRD/ZuwUQJWXlmEHq4nvVVZQq2qyCW
 uJhyMiYynhED2xRp1dYnn2WtxyKYrzlAeFTdpA2MjYPnnFlUgfDzF3iVi1DblGDVpIJk
 /YKcYcCCvGgUbae3SNKzZcHXOv8wEsWzXbqoXp0R/B6s+8H1kj84IX1Ry4qPscZeb82f
 okXg6qwy+7m0vZOTrSARfgVeXK3ghcw/TSwuIef1y46SphoDDhSphYoeQP4fSskGzm8y
 lyh7wQWBHz7Wl4w5DAdsUtslygLAKLX07A64zYNQqujSAhnXl/NlokgketH41cnNlmjE
 WXDw==
X-Gm-Message-State: AOAM5332Fl6JUiwfbwVL5KTD5BBQAYYfRffwqiqMHuZXjaww+3JbPgYA
 uojSK0ZX67KmkcajEG7Y8WnlQSI4WgUs+eQLEXRYs0fvKVn/HVU9hsO4WLMtb6br1h+ng/hTF0F
 7h+S6P/gUrKeuTzE=
X-Received: by 2002:adf:de84:: with SMTP id w4mr4963517wrl.67.1640363904581;
 Fri, 24 Dec 2021 08:38:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza7PdVgwFgT7dPBmZ6gGsFMViI7NtgeyRpSKNeYrXTLskNDE/8/Src5Tql9JpUwUuw5fgnuw==
X-Received: by 2002:adf:de84:: with SMTP id w4mr4963501wrl.67.1640363904410;
 Fri, 24 Dec 2021 08:38:24 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id g198sm9076073wme.23.2021.12.24.08.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 08:38:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 1/6] migration: All this fields are unsigned
In-Reply-To: <YcVy7mu1GVyLvV/n@xz-m1.local> (Peter Xu's message of "Fri, 24
 Dec 2021 15:12:46 +0800")
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-2-quintela@redhat.com>
 <YcVy7mu1GVyLvV/n@xz-m1.local>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 24 Dec 2021 17:38:22 +0100
Message-ID: <871r22j6v5.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> On Tue, Dec 21, 2021 at 01:52:30PM +0100, Juan Quintela wrote:
>> So printing it as %d is wrong.  Notice that for the channel id, that
>> is an uint8_t, but I changed it anyways for consistency.
>
> Just curious: uint_8 can always correctly converted to a int, so the patc=
h
> shouldn't have a functional change, right?

Yeap.  My understanding of C promotion rules is that everything is
promoted to int by default, if the size is smaller than positive part of
it, that is ok.

But once there, I reviewed all "%d", and if it was unsigned, I change it
to "%u".

>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks, Juan.


