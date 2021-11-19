Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832F456ECC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:27:23 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2zC-0006qF-4e
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2xI-000610-SI
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:25:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2xG-00013z-5u
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637324721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PBVHcHikFmshS2Dbj9EmuPMfTRVxqftpv2WCMDxBjEc=;
 b=OF0jWaymHjkVCOMcvZKzM/pA8cvAJlgLBocqDQvnuumW8Ze2F4TAeq5BGXV5faARn3FYRl
 WLRowiq3tnhIDq3u26+Fp1jiNqjvOGQRN+s6TOz3k9SNuwKRYFzHGUzrXAebpHaFodgZzy
 0ypSIRRaUQiN8LBGCbfpKyW+HUpNwbs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-y1jpBHxnMH2GPYskYlaH-A-1; Fri, 19 Nov 2021 07:25:20 -0500
X-MC-Unique: y1jpBHxnMH2GPYskYlaH-A-1
Received: by mail-pl1-f200.google.com with SMTP id
 l3-20020a170902f68300b00142892d0a86so4434546plg.13
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 04:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBVHcHikFmshS2Dbj9EmuPMfTRVxqftpv2WCMDxBjEc=;
 b=bawqGI7wN0C5SmamEz32Hm165h+SeueBoGZpFnAPVnXFRrVkPd5nfjLbhIJwO+TWzf
 cIR4IWWgRasrB1+ExjV6SMb0oKrlu4SLfCqaEos64g9kHX6raUsk4xl6KZ2w4UsuYQTf
 3Oabd2LIBbXmnc2Ae31ynBS2UocaVvaRvMXRkz8FOH1po3RKRE9VY3kShJm5v+CGNmmf
 vv25Z4a9kBU9zS6yWvZ2y8919m1URiXBSStmGBA58d1jAbiD8zhS7+ABpUSkV6X+uWIb
 0yYFKIAV1BjUmDu3sCpXQzpgjfVQM54r7I536X4oIAh8ZVZ24CAJnuC7ZzdZx2WPMOE7
 OuMA==
X-Gm-Message-State: AOAM531ifh7LFK6pDBSCKjagof5bJ0o96G6Jdb9fp8h+tPIAVyyZM2Fs
 TcaL3eEzB4Kmt4QV3adSqBmHFwoHh61nKqDf2HP7rE8wVJ5D4jNaFFgeeW6KEifmdZyh23QEWF8
 68q26SIfuTDcwbIDITfNFR13FAYcUlf0=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr63806627pfn.38.1637324719418; 
 Fri, 19 Nov 2021 04:25:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaE4QvjnhR15Q//iZCTWzy58y/TnIaJB3GkjP7GOmbZeVqwVIop9yJoqZyopyPd2HLscPjtk6bRJZOOKjw15Q=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr63806596pfn.38.1637324719160; Fri, 19
 Nov 2021 04:25:19 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-4-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-4-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 09:24:52 -0300
Message-ID: <CAKJDGDaOzTxNdSShon394FjKgyxLihqeKjaB-E_Wm0bbCLAzpw@mail.gmail.com>
Subject: Re: [PATCH 3/7] python/machine: add instance disambiguator to default
 nickname
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 5:49 PM John Snow <jsnow@redhat.com> wrote:
>
> If you create two instances of QEMUMachine(), they'll both create the
> same nickname by default -- which is not that helpful.
>
> Luckily, they'll both create unique temporary directories ... but due to
> user configuration, they may share logging and sockfile directories,
> meaning two instances can collide. The Python logging will also be quite
> confusing, with no differentiation between the two instances.
>
> Add an instance disambiguator (The memory address of the instance) to
> the default nickname to foolproof this in all cases.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


