Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ECA48B8D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:48:54 +0100 (CET)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7O4b-0005Bl-2k
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7O1p-0003Uz-32
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7O1m-0007Wz-6j
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641933952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZyvk9qH2kOIwfefKxzepb+eFGuu6cXPh47ntIKDRhU=;
 b=EvtFErHNowIngnbu/Z8DS+AgbCb0YsvftS2GFbuq1qj0uWdZoZuJ+UiAasjFHWXEMgHBTn
 vt/1bpOpzkXnYdYzZEtTyd0zE5tc+5LOgDrGhl1rdv7s34/wNRQqCR2iT67wdeAtbdmG4m
 J3/EGazcdzZ4W0vBDufxntGdYy3EtqM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-_7xK5VRXOraeELZCQd3PIg-1; Tue, 11 Jan 2022 15:45:50 -0500
X-MC-Unique: _7xK5VRXOraeELZCQd3PIg-1
Received: by mail-ua1-f71.google.com with SMTP id
 y7-20020ab05607000000b003065444c62dso247106uaa.13
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 12:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZyvk9qH2kOIwfefKxzepb+eFGuu6cXPh47ntIKDRhU=;
 b=fwsBfOa8Ns/HH3pnOUVQDJNFZCze1R+m1SVIsLWn3p7tID5rdOrhDquB4ASQHfRl41
 FgjtplczNrHOjD0FwaLm9XDMm6vnJExMGJm35NCIa5Gmu0pqs9+XzJgeZET6PsAF5VT5
 0MZfeHbJhu8gscsZkAMpy80d/hLlgHq0aAHmaYqF5pYba6jZA+u+zO1tQffzJzpW3gD9
 69i1MAtQV6TM/RTQ3ZMd/PRInlf1zd9VtQGL/jdsVM27HOV0sp+9ee94lJlX9Zx0tL0c
 ijHkbAMhWIbN+Ni0SWgrbif86/3TkQeqnrx5HJAMJmKxftsT97PXOWk/MmgDZetbuPCY
 CdRg==
X-Gm-Message-State: AOAM532kjQYiQKqi3AoBNffBYxBFom5/ZBmaFO0NPU1tQOxP1eQ+YhMp
 ChLFgJ0cqOF/hAkZkc79bI0PL3YkTNco0tsnyZLs6HERcpR0hrRJ4viCTEAG0vNMvjS4iEkTJ0w
 FC03+IAOhMJLhuPFsLs4kkj/7Wy1dawM=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr3187145vsl.38.1641933948736; 
 Tue, 11 Jan 2022 12:45:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWJbykpfnUlPqjgTqALB+MXHWJ4jG7pqTyVOGYIHF+mwc1y49F3kaMaTV0vscQG7llvlxdYHXBB9Zu9Tc0/wE=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr3187137vsl.38.1641933948603; 
 Tue, 11 Jan 2022 12:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20211222153600.976588-1-thuth@redhat.com>
In-Reply-To: <20211222153600.976588-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 15:45:38 -0500
Message-ID: <CAFn=p-bXCDoUH3yi1kT9yVh12jwnuM6BQCL6bjCDURyLOoF7vA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/hd-geo-test: Check for the lsi53c895a
 controller before using it
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 10:36 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The lsi53c895a SCSI controller might have been disabled in the target
> binary, so let's check for its availability first before using it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/hd-geo-test.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 113126ae06..771eaa741b 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -960,9 +960,11 @@ int main(int argc, char **argv)
>      qtest_add_func("hd-geo/ide/device/user/chst", test_ide_device_user_chst);
>      if (have_qemu_img()) {
>          qtest_add_func("hd-geo/override/ide", test_override_ide);
> -        qtest_add_func("hd-geo/override/scsi", test_override_scsi);
> -        qtest_add_func("hd-geo/override/scsi_2_controllers",
> -                       test_override_scsi_2_controllers);
> +        if (qtest_has_device("lsi53c895a")) {
> +            qtest_add_func("hd-geo/override/scsi", test_override_scsi);
> +            qtest_add_func("hd-geo/override/scsi_2_controllers",
> +                           test_override_scsi_2_controllers);
> +        }
>          qtest_add_func("hd-geo/override/virtio_blk", test_override_virtio_blk);
>          qtest_add_func("hd-geo/override/zero_chs", test_override_zero_chs);
>          qtest_add_func("hd-geo/override/scsi_hot_unplug",
> --
> 2.27.0
>

Acked-by: John Snow <jsnow@redhat.com>


