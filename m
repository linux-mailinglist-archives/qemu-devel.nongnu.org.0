Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553E48CDF0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:45:04 +0100 (CET)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7lQU-0002a3-Hg
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7lNg-0000zx-Mo
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:42:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7lNc-0005fM-JY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642023721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SI405gvp+1/+BZBEg3/2OCgER/N5jIaS9/d8HAP384=;
 b=drheuIUo+V554bmisMsmvG05CWrhGjsxQfAHHVPgnQ4DpBjcoZt+GAStnw4weqNl+wBp0o
 bMjc7vwYTsO3syEA/XQFNTnajG9P7t176x7ESxGE4OVX7LyERn+Jk2kCHZ4TK9tL6FUuV0
 jAFPhQHecQ+0RLI71g+kwRbVWN/vyi0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-7lINqZGiPWa-niwUhn2VVQ-1; Wed, 12 Jan 2022 16:42:00 -0500
X-MC-Unique: 7lINqZGiPWa-niwUhn2VVQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 g28-20020ab016dc000000b002fb2c2eb14aso2446245uaf.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 13:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9SI405gvp+1/+BZBEg3/2OCgER/N5jIaS9/d8HAP384=;
 b=KnlEPbBjq9bS1hHrckLcu6BP5FovOn2O/35+/1sgL2LoFfPDU0F8G8n4SQ6HMpORw1
 svmHXjimSTvtLH/dpTt8Hziwl3lLdHeKhw3eZ2SsfbnrCs3mcZilyI5U8IWOhWG/XoG6
 8xSjIO0mHo9yDlf4CAC+xeERmkRXtMjlQkbsHAIqvx+mJCLEM+HuU4Yo0BWbnxsvL9zm
 ZV/5MBvzAuzMHYZwxDYYeYzXGEvvekw8H13PV8U1BUkFpJ9seOWbNuapW+jwh6CuUyYZ
 2dWv0bw5il4z8K4ggT9Y+kUSv3+Q5sSoiaT079OOGAGA9Si5Owb27PA+Dtx2DY/Z5EmQ
 Sp8g==
X-Gm-Message-State: AOAM531f+dXjyWG4PFC1BBMN0KMGBmrHOlox97OuGzUkrlWayur4B4nG
 fWmVILLFVvN2CMhwZTFlrcfOMkLKZQSlG6eS8c0WNSD4Ta+Uc38+8XYOeoC21r5VpDstVWhoWZx
 +AJcXdDGDoL4s3XmLC5ZEJnQP1cFlPrA=
X-Received: by 2002:a05:6102:1045:: with SMTP id
 h5mr1105865vsq.38.1642023719664; 
 Wed, 12 Jan 2022 13:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVjBuITnoLQpeNBpXeX7+L1eb7tsQW771G+0J3Znvmh52mofU3Q0qmSGzwgvhno5w0j6GCrUWayDFdUpJ695o=
X-Received: by 2002:a05:6102:1045:: with SMTP id
 h5mr1105853vsq.38.1642023719487; 
 Wed, 12 Jan 2022 13:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <YbsXvBwgSuCuhzK/@redhat.com>
In-Reply-To: <YbsXvBwgSuCuhzK/@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 16:41:48 -0500
Message-ID: <CAFn=p-YRYghUGOT3iqaJ9TiCe1mL6YoSKHAwqz=04QLDyuWMaQ@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 00/24] Python: Fork qemu.qmp Python lib into
 independent repo
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Jeff Nelson <jenelson@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 5:41 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Dec 15, 2021 at 04:06:10PM -0500, John Snow wrote:

> > (2) To ask for permission to become the maintainer of a
> > 'qemu-project/qemu.qmp' repository, where I would like to host this
> > subproject.
>
> I'd say we need 3 designated maintainers as a minimum for redundancy.

Let's see how many people we can get to volunteer. If it's part of the
qemu-project umbrella, I assume anyone with access to the entire
project as a whole can step in and re-assign permissions and do
emergency actions as needed, including stsquad, stefanha, etc. That
ought to be enough to get moving. If we want to add anyone for
operational redundancy, I'd be happy to add as many people that
volunteer :)

So: any volunteers? Cleber, Beraldo, Wainer? Anyone else?

I anticipate this to be extremely low traffic after the churn of
splitting it out is done with, it shouldn't be a big daily cost -- but
having some familiarity with the code would be good in case you need
to accept some urgent patches here and there.

--js


