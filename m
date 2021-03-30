Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAE34E5D4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:54:45 +0200 (CEST)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRC1E-0005LW-To
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRBzo-0004ne-8j
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRBzk-0008Lp-J6
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617101591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bE011nuwBrOSBvLIrZRPIM42GmURImdrJhSknEuPx94=;
 b=enUjolOV7WTURnOF/GWOonuABu1fMkErz8MogPDsf5jmBG0d3+2r39l0Ye8Ik7DMzbFfH1
 stp6Vw8MgBuWEVuAvLriUkq9KGnKWBwXg4GVy8rRZmNo2deRS9pBhq1SqCY0uyx3j66Gwl
 aJ/sT2xXxXOlDdLq7Jm9SnWGfa0r8C8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-7eXuCE7GMoKiEEmnVtRcRQ-1; Tue, 30 Mar 2021 06:53:08 -0400
X-MC-Unique: 7eXuCE7GMoKiEEmnVtRcRQ-1
Received: by mail-wm1-f72.google.com with SMTP id k132so538893wma.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 03:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bE011nuwBrOSBvLIrZRPIM42GmURImdrJhSknEuPx94=;
 b=m3O1A8xh0w6A6cwwWTPhqVTEdwj0R/8FVBrr3nqqzHOGC1vZ7sI5peP+9e84tIqqe1
 BZi2IVMm4GRQRq1FKE42JBMm30Jbx04NYgn2B2frQQnJQWdd5ZP/MbzqYaZKzGaS5Tw4
 9ZsauMKj8BMJWRKwavdeSZRLXeTK2oInuDYauD6b8F7qkI7vugaAdnTihBkq+ia8wFXz
 FJUfnZkQAeKnrOQMvFQ3sAXDbJg+nDdsKDkjyKzlLA9Jx08AFGKQ5vZh0JWtVLPeEmfy
 /n94Pp90Wrjme5bqApdb1ENtoln6JmZjRhIXkwk5vj/l71Rasfd38jVEVom8iac1Crz7
 CqEA==
X-Gm-Message-State: AOAM5314bWMHM9fQet5GzscJtBPG6u4YFKeo/jZHWju6ZE0XY+sDCJZA
 TnoqlXZr3jiMBI/fQnKkzDZz7+OKQUFLyi6+YGyRDnNY34BRUzEtMpGHwwmacbPSfU07oZIiNgA
 Nwq7uv1GAd8Gpvts=
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr3437357wmq.11.1617101587133; 
 Tue, 30 Mar 2021 03:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJzko4A/RRVi2mYIDxNjf8aC1WE76q7BqcdBlyiEzAsyXeuA5j15KnrBpx0z7AqfbMitsE3A==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr3437337wmq.11.1617101586920; 
 Tue, 30 Mar 2021 03:53:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b12sm35704442wrf.39.2021.03.30.03.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:53:06 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210330090806.2802667-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Message-ID: <c8cc80d5-51f8-9c35-ad98-1eac0d164be6@redhat.com>
Date: Tue, 30 Mar 2021 12:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210330090806.2802667-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 11:08, Thomas Huth wrote:
>   I've picked the Django Code of Conduct as a base, since it sounds rather
>   friendly and still welcoming to me, but I'm open for other suggestions, too
>   (but we should maybe pick one where the conflict resolution policy is
>   separated from the CoC itself so that it can be better taylored to the
>   requirements of the QEMU project)

It turns out that the Django CoC is ultimately based on the Fedora CoC,
so I tried using https://docs.fedoraproject.org/en-US/project/code-of-conduct/
as an inspiration for what can be cut. Here is the outcome:

-----
The QEMU community is made up of a mixture of professionals and
volunteers from all over the world. Diversity is one of our strengths,
but it can also lead to communication issues and unhappiness.
To that end, we have a few ground rules that we ask people to adhere to.

* Be welcoming. We are committed to making participation in this project
   a harassment-free experience for everyone, regardless of level of
   experience, gender, gender identity and expression, sexual orientation,
   disability, personal appearance, body size, race, ethnicity, age, religion,
   or nationality.

* Be respectful. Not all of us will agree all the time.  Disagreements, both
   social and technical, happen all the time and the QEMU community is no
   exception. When we disagree, we try to understand why.  It is important that
   we resolve disagreements and differing views constructively.  Members of the
   QEMU community should be respectful when dealing with other contributors as
   well as with people outside the QEMU community and with users of QEMU.

Harassment and other exclusionary behavior are not acceptable. A community
where people feel uncomfortable or threatened is neither welcoming nor
respectful.  Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery

* Personal attacks

* Trolling or insulting/derogatory comments

* Public or private harassment

* Publishing other's private information, such as physical or electronic
addresses, without explicit permission

This isn't an exhaustive list of things that you can't do. Rather, take
it in the spirit in which it's intended—a guide to make it easier to
be excellent to each other.

This code of conduct applies to all spaces managed by the QEMU project.
This includes IRC, the mailing lists, the issue tracker, community
events, and any other forums created by the project team which the
community uses for communication. This code of conduct also applies
outside these spaces, when an individual acts as a representative or a
member of the project or its community.

By adopting this code of conduct, project maintainers commit themselves
to fairly and consistently applying these principles to every aspect of
managing this project.  If you believe someone is violating the code of
conduct, please read the +:ref:`conflict-resolution` document for
information about how to proceed.

This document is based on the `Fedora Code of Conduct
<https://fedoraproject.org/code-of-conduct>`__ and the
`Contributor Covenant version 1.3.0
<https://www.contributor-covenant.org/version/1/3/0/code-of-conduct/>`__.
----

As a comparison:
* Contributor Covenant 1.3.0: 308 words
* text above: 386 words
* Fedora Code of Conduct: 429 words
* Contributor Covenant 1.4: 442 words
* Django Code of Conduct: 663 words


Thanks,

Paolo


