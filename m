Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D396943FB0B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:47:48 +0200 (CEST)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgPQI-0008Tk-O9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPNX-0006qj-87
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgPNV-0006eF-Ew
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 06:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635504292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BKDZuwJAgpcYs0yQ7As1+hZ11hawjDoazr/LlY+HM8=;
 b=dkgf5TEeFaynvFS9h2CRqPfOQh1xaf1ydS+EOdXOHkH2SGqXpJWLV6k5JNbdGN6JVfUBvw
 O/K4LMYdLDmBLticfLENpaBF+ESadsEruWDz1w+WCEQ0slF2mVgXXiTkhmBX0jcl6a7K6M
 fioZGK/V3bu0aT5iEr1K0ovX42BvMmo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-7bBUnFBvPROW56m-OL5bOw-1; Fri, 29 Oct 2021 06:44:51 -0400
X-MC-Unique: 7bBUnFBvPROW56m-OL5bOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 125-20020a1c0183000000b003306ae8bfb7so1246555wmb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 03:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2BKDZuwJAgpcYs0yQ7As1+hZ11hawjDoazr/LlY+HM8=;
 b=XMyMyPwMHgNPiAWfxPBgghXBBxoV8JlFeRv3QD67ZSURmre3Uslo1b+28r+gzyUPUG
 fq0k/zf/FhgGGYJ3PMDYI7T6aNUWFFz2Wg+Wp2mcMxJ97AAQ87CoZJ5Kc8J4GpW4MLdI
 zjLTEjWLLG7W6oElu/YvVe85/kfGGDPpkEWQhrItwkYq01BEKfDTLXc6PrQYAY580alJ
 1E5JBU7jMnGKYDyEqsujZ4dGwia9ApEaAcZBlqGuSIxuTI/YJVCjwwI2BZk16ioi6YpP
 9P6OW+acSg/2/+3dltYx0EvNmxucroj4nyw5h9G0bk7LAl1DisQM/bVDYiVEv0q3qZ6T
 Oxig==
X-Gm-Message-State: AOAM531UqMJH1aUWThp4lLeA6sjm8bOZhe0SbR0uqt7nPyDtWdw5RGpa
 QXKNQLa+eouxvdPTF0VrrUqmTkgVP8YhrcROKJPxqPktB+k6016ZGD8WBJSUFK9d89pMNjlF0l4
 UNvhuT9E+1O8oHUc=
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr1862330wrr.143.1635504287196; 
 Fri, 29 Oct 2021 03:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweqb29JeZSUqLNspnLgbaJnjaase0Z/w9ovICSuEKsp7k3psSttEk7IKX00fNF0llvU8IIbg==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr1862303wrr.143.1635504287052; 
 Fri, 29 Oct 2021 03:44:47 -0700 (PDT)
Received: from localhost ([178.139.224.158])
 by smtp.gmail.com with ESMTPSA id q18sm8601088wmc.7.2021.10.29.03.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 03:44:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 6/9] qapi: Generalize command policy checking
In-Reply-To: <20211028102520.747396-7-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 28 Oct 2021 12:25:17 +0200")
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-7-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 12:44:45 +0200
Message-ID: <87pmrot8iq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, philmd@redhat.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> The code to check command policy can see special feature flag
> 'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
> flag 'unstable' visible there as well, so I can add policy for it.
>
> To let me make it visible, add member @special_features (a bitset of
> QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
> through qmp_register_command().  Then replace "QCO_DEPRECATED in
> @flags" by QAPI_DEPRECATED in @special_features", and drop
> QCO_DEPRECATED.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Acked-by: John Snow <jsnow@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


