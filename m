Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64A581959
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:06:56 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOxL-0001KJ-64
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oGOs0-0004J0-QF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:01:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oGOrs-0006fx-JU
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658858472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0bieGpr7nBlw/YiBTWdOGt8hsTKFMXJ92Hm8K4nWSg=;
 b=LgRiB9plSl2kRXVFJL2UCZiJJlEksfE66mBBxQKB3To2blZp2ht+cifBUy6WdX5nEYze1N
 DK6ZX/vsCE9NP/BY83uxayWKHOd6yKCuPCMQfrG4/wj4sz34hF6XPnkMSI33WgWsdYCbCg
 /nSVbda6sBbukQePmW0JoanCvIdgU9I=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390--Z7u2nkKPb-SOgodmjh0tw-1; Tue, 26 Jul 2022 14:01:03 -0400
X-MC-Unique: -Z7u2nkKPb-SOgodmjh0tw-1
Received: by mail-vk1-f199.google.com with SMTP id
 t11-20020a1f780b000000b003765b026e95so1191499vkc.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0bieGpr7nBlw/YiBTWdOGt8hsTKFMXJ92Hm8K4nWSg=;
 b=Oak2T0HeNTw4Ouumb13POudI+aN0EIpWgq0NVhr0/quTPcCkkb4J8ytlAxRXjjLD9v
 guurY0xecB2dH2AC153wbOj8f6Styq3SxR8gEdFmiZpnxlZsMhh05ORZos8hmYWQQ3rI
 rDGxTsbVYh1iJUjvdQippFQnJi8lLYOReFuGkfXv0sPo4xETIYmUHm9Nv4dcoGKVApbH
 VHIUXWUEB7SMWuIFf7IgBVp891XL1E4ZPCK2gwSqkrLEKEn5riiwtcyzEHWoXroCB8Zs
 A4IuLPW0r2EkkISI6bOHX3fvFBl8r8iYRKNOpPfmdkh9A57Hos9V6t36gewZjq++TunH
 J6BQ==
X-Gm-Message-State: AJIora9qe67JzyXO3S88iDC04U5QJGGe4sJxez+6h2aRK826kyuxIf0Y
 JOTpdnkACAI9zpQhgePS9yGvuXJSmxVMUF4Z41cM3VQIbRgKAwAUwaOFOrqsGxfJ0Aus6DQ++I+
 KTIaAV9X1TyzHw3CJaVCnUyhClLz2He4=
X-Received: by 2002:a1f:cc82:0:b0:376:9e8b:7a74 with SMTP id
 c124-20020a1fcc82000000b003769e8b7a74mr1290277vkg.24.1658858462738; 
 Tue, 26 Jul 2022 11:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhWhaQtTmrX4DHzPYAGmCrJ4ItCRKpBZ9n0SQon/t+ZdOHsTqBZRehZf6XfuHkSRvVE9+GNEAgYkBZmCXlQIo=
X-Received: by 2002:a1f:cc82:0:b0:376:9e8b:7a74 with SMTP id
 c124-20020a1fcc82000000b003769e8b7a74mr1290232vkg.24.1658858462432; Tue, 26
 Jul 2022 11:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <1658851843-236870-41-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1658851843-236870-41-git-send-email-steven.sistare@oracle.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Jul 2022 14:00:51 -0400
Message-ID: <CAFn=p-aMB-rXexaFm_B8AjahHmD1XqExsHLkXOM94Y0BWXL4UA@mail.gmail.com>
Subject: Re: [PATCH V9 40/46] python/machine: QEMUMachine full_args
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 26, 2022 at 12:12 PM Steve Sistare
<steven.sistare@oracle.com> wrote:
>
> Provide full_args() to return all command-line arguments used to start a
> vm, some of which are not otherwise visible to QEMUMachine clients.  This
> is needed by the cpr test, which must start a vm, then pass all qemu
> command-line arguments when setting the cpr-exec-args migration parameter.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  python/qemu/machine/machine.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 37191f4..d05950e 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -332,6 +332,11 @@ def args(self) -> List[str]:
>          """Returns the list of arguments given to the QEMU binary."""
>          return self._args
>
> +    @property
> +    def full_args(self) -> List[str]:
> +        """Returns the full list of arguments used to launch QEMU."""
> +        return list(self._qemu_full_args)
> +
>      def _pre_launch(self) -> None:
>          if self._console_set:
>              self._remove_files.append(self._console_address)
> --
> 1.8.3.1
>

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>


