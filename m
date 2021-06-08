Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A103A013A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:09:06 +0200 (CEST)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqh61-0005km-C2
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqh5C-00053G-1G
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqh58-0007jN-Hk
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623179289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AXaljUFGEyjkHcsp+R/0eeDFwEvn6KcemDhrZ7mktp4=;
 b=Ecs9dYfY1c3rDfr/0ng6nw6rRuRSzNF1nE9yGF4FtfZxoYNckHLR2FPzolqjUlDSw9YH/c
 jhti937FNLJSRdqcBjgYOxpWJgeNtedePjOrm78zkihJTAMobnjFNecxCwkYLWU+K4W15/
 Q62YkgJTmzntmi15xv0MlfxyYs1lOLA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-1g5P48ANPEOSSu-phBMDcg-1; Tue, 08 Jun 2021 15:08:05 -0400
X-MC-Unique: 1g5P48ANPEOSSu-phBMDcg-1
Received: by mail-qk1-f198.google.com with SMTP id
 s4-20020a3790040000b02902fa7aa987e8so15714270qkd.14
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=AXaljUFGEyjkHcsp+R/0eeDFwEvn6KcemDhrZ7mktp4=;
 b=KRvldPTo7N43gf0KKKyYuKncMy8jBxECoogkzvmq+ogMS87nOjhAD/7DsAg4LvpZy7
 xgegJdNixQaWbYlDTSPk76ArXH4qJO2FPftKWSHu/YfLGkqVbjQXXb3Rw6mtJKYKhG3e
 MyIUVfaN47Svflj2briKCM2FJzSNakdxYBANUAka+YCOTywPDRRkWLo2ZTXAO6JSv437
 Ps19V/Y6ksT/a6YRdOfIP4jqkdSHtq0XfvJnE11cN1sSjSHkHXecesINM+2eXR9bD+wK
 XvbPu7KqPLWeiT1odRSRgvwEHHIgMz/gGgUuzTm+KBBZJ4XYfpW4lsrYLqoAbC3sQztg
 3Pcw==
X-Gm-Message-State: AOAM5318LL1gCn76PAVVbIBUsLS40EKNwZegBh2WGa1Odmfs6eMtcdmZ
 mSIKCYA2zaSa9gK1hWUPjmoSESVEWkkX0njjY+Xt+9nyAlZ9NpqrB1uHT5MNl/pOLvyWch3vFvH
 d3IUC+IBqQMedb34=
X-Received: by 2002:ad4:5d67:: with SMTP id fn7mr1417703qvb.1.1623179284665;
 Tue, 08 Jun 2021 12:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOLSv/yBCLKhfkoUL+N+WPnfhQykDWOso7aGCX3QLqNuGaAyUI0Wq5pZnWszGKk/ygmPotuQ==
X-Received: by 2002:ad4:5d67:: with SMTP id fn7mr1417686qvb.1.1623179284531;
 Tue, 08 Jun 2021 12:08:04 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id s6sm3747226qks.102.2021.06.08.12.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:08:03 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <6f4a0d6a-b306-5c14-1def-483ed9b81fda@redhat.com>
Date: Tue, 8 Jun 2021 16:07:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------26BC45211DFFEBD220739C44"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------26BC45211DFFEBD220739C44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 6/8/21 10:36 AM, Cleber Rosa Junior wrote:
>
>
> On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> wrote:
>
>     Hi Alex, Stefan,
>
>     On 6/8/21 5:14 AM, Cleber Rosa wrote:
>     > The QEMU project has two machines (aarch64 and s390x) that can
>     be used
>     > for jobs that do build and run tests.
>
>     AFAIK there is more hardware available to the project, so I'm
>     wondering
>     what happened to the rest, is it a deliberate choice to start small?
>
>
> Hi Phil,
>
> Yes, this series was deliberately focused on the first two machines 
> owned and available to QEMU.
>
>     What will happen with the rest, since we are wasting resources?
>
>
> The plan is to allow all machines (currently available and to-be 
> available) to be connected as custom runners. This hopefully gets that 
> started.
>
> About "more hardware available to the project", there's one VM from 
> fosshost which was made available not long ago, and which I set up 
> even more recently, which could be used as a gitlab runner too.  But, 
> even though some new hardware resource is available (and wasted?), the 
> human resources to maintain them have not been properly determined, so 
> I believe it's a good decision to start with the machines that have 
> been operational for long, and that already have to the best of my 
> knowledge, people maintaining them.
>
> I also see a "Debian unstable mips64el (Debian) @ cipunited.cn 
> <http://cipunited.cn>" registered as a runner, but I don't have extra 
> information about it.
>
> Besides that, I'll send another series shortly, that builds upon this 
> series, and adds a Red Hat focused job, on a Red Hat managed machine.  
> This should be what other entities should be capable of doing and 
> allowed to do.
>
>     Who has access to what and should do what (setup)? How is this list of
>     hw managed btw? Should there be some public visibility (i.e. Wiki)?
>
>
> These are good questions, and I believe Alex can answer them about 
> those two machines.  Even though I hooked them up to GitLab, AFAICT he 
> is the ultimate admin (maybe Peter too?).
>
> About hardware management, it has been suggested to use either the 
> Wiki or a MAINTAINERS entry.  This is still unresolved and feedback 
> would be appreciated.  For me to propose a MAINTAINERS entry, say, on 
> a v7, I'd need the information on who is managing them.
>
>
>     Is there a document explaining what are the steps to follow for an
>     entity to donate / sponsor hardware? Where would it be stored, should
>     this hw be shipped somewhere? What documentation should be
>     provided for
>     its system administration?
>
>     In case an entity manages hosting and maintenance, can the QEMU
>     project
>     share the power bill? Up to which amount?
>     Similar question if a sysadmin has to be paid.
>
>     If the QEMU project can't spend money on CI, what is expected from
>     resource donators? Simply hardware + power (electricity) + network
>     traffic? Also sysadmining and monitoring? Do we expect some kind of
>     reliability on the data stored here or can we assume disposable /
>     transient runners?
>     Should donators also provide storage? Do we have a minimum storage
>     requirement?
>
>     Should we provide some guideline explaining any code might be run by
>     our contributors on these runners and some security measures have to
>     be taken / considered?
>
>     Sponsors usually expect some advertising to thanks them, and often
>     regular reports on how their resources are used, else they might not
>     renew their offer. Who should care to keep the relationship with
>     sponsors?
>
>     Where is defined what belong to the project, who is responsible,
>     who can
>     request access to this hardware, what resource can be used?
>
>
> You obviously directed the question towards Alex and Stefan 
> (rightfully so), so I won't attempt to answer these ones at this point.
>
>     More generically, what is the process for a private / corporate entity
>     to register a runner to the project? (how did it work for this aarch64
>     and s390x one?)
>
>
> The steps are listed on the documentation.  Basically anyone with 
> knowledge of the "registration token" can add new machines to GitLab 
> as runners.  For the two aarch64 and s390x, it was a matter of 
> following the documentation steps which basically involve:
>
> 1) providing the hostname(s) in the inventory file
> 2) provide the "registration token" in the vars.yml file
> 3) running the playbooks
>
>
>     What else am I missing?
>
>
> I think you're missing the answers to all your good questions :).
>
> And I understand that are a lot of them (from everyone, including 
> myself).  The dilemma here is: should we activate the machines already 
> available, and learn in practice, what's missing?  I honestly believe 
> we should.


IMHO we should merge the minimum possible to start using the existing 
machines, then address the questions (good questions, btw) raised by 
Philippe as needed.

Thanks!

- Wainer

>
> Thanks,
> - Clr.
>
>     Thanks,
>
>     Phil.
>
>     > This introduces those jobs,
>     > which are a mapping of custom scripts used for the same purpose.
>     >
>     > Signed-off-by: Cleber Rosa <crosa@redhat.com
>     <mailto:crosa@redhat.com>>
>     > ---
>     >  .gitlab-ci.d/custom-runners.yml | 208
>     ++++++++++++++++++++++++++++++++
>     >  1 file changed, 208 insertions(+)
>

--------------26BC45211DFFEBD220739C44
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 6/8/21 10:36 AM, Cleber Rosa Junior
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jun 8, 2021 at 2:30
            AM Philippe Mathieu-Daudé &lt;<a
              href="mailto:f4bug@amsat.org" moz-do-not-send="true">f4bug@amsat.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi Alex, Stefan,<br>
            <br>
            On 6/8/21 5:14 AM, Cleber Rosa wrote:<br>
            &gt; The QEMU project has two machines (aarch64 and s390x)
            that can be used<br>
            &gt; for jobs that do build and run tests.<br>
            <br>
            AFAIK there is more hardware available to the project, so
            I'm wondering<br>
            what happened to the rest, is it a deliberate choice to
            start small?<br>
          </blockquote>
          <div><br>
          </div>
          <div>Hi Phil,</div>
          <div><br>
          </div>
          <div>Yes, this series was deliberately focused on the first
            two machines owned and available to QEMU. </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            What will happen with the rest, since we are wasting
            resources?<br>
          </blockquote>
          <div><br>
          </div>
          <div>The plan is to allow all machines (currently available
            and to-be available) to be connected as custom runners. 
            This hopefully gets that started.</div>
          <div><br>
          </div>
          <div>About "more hardware available to the project", there's
            one VM from fosshost which was made available not long ago,
            and which I set up even more recently, which could be used
            as a gitlab runner too.  But, even though some new hardware
            resource is available (and wasted?), the human resources to
            maintain them have not been properly determined, so I
            believe it's a good decision to start with the machines that
            have been operational for long, and that already have to the
            best of my knowledge, people maintaining them.</div>
          <div><br>
          </div>
          <div>I also see a "Debian unstable mips64el (Debian) @ <a
              href="http://cipunited.cn" moz-do-not-send="true">cipunited.cn</a>"
            registered as a runner, but I don't have extra information
            about it.<br>
          </div>
          <div><br>
          </div>
          <div>Besides that, I'll send another series shortly, that
            builds upon this series, and adds a Red Hat focused job, on
            a Red Hat managed machine.  This should be what other
            entities should be capable of doing and allowed to do.<br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Who has access to what and should do what (setup)? How is
            this list of<br>
            hw managed btw? Should there be some public visibility (i.e.
            Wiki)?<br>
          </blockquote>
          <div><br>
          </div>
          <div>These are good questions, and I believe Alex can answer
            them about those two machines.  Even though I hooked them up
            to GitLab, AFAICT he is the ultimate admin (maybe Peter
            too?).</div>
          <div><br>
          </div>
          <div>About hardware management, it has been suggested to use
            either the Wiki or a MAINTAINERS entry.  This is still
            unresolved and feedback would be appreciated.  For me to
            propose a MAINTAINERS entry, say, on a v7, I'd need the
            information on who is managing them.</div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Is there a document explaining what are the steps to follow
            for an<br>
            entity to donate / sponsor hardware? Where would it be
            stored, should<br>
            this hw be shipped somewhere? What documentation should be
            provided for<br>
            its system administration?<br>
            <br>
            In case an entity manages hosting and maintenance, can the
            QEMU project<br>
            share the power bill? Up to which amount?<br>
            Similar question if a sysadmin has to be paid.<br>
            <br>
            If the QEMU project can't spend money on CI, what is
            expected from<br>
            resource donators? Simply hardware + power (electricity) +
            network<br>
            traffic? Also sysadmining and monitoring? Do we expect some
            kind of<br>
            reliability on the data stored here or can we assume
            disposable /<br>
            transient runners?<br>
            Should donators also provide storage? Do we have a minimum
            storage<br>
            requirement?<br>
            <br>
            Should we provide some guideline explaining any code might
            be run by<br>
            our contributors on these runners and some security measures
            have to<br>
            be taken / considered?<br>
            <br>
            Sponsors usually expect some advertising to thanks them, and
            often<br>
            regular reports on how their resources are used, else they
            might not<br>
            renew their offer. Who should care to keep the relationship
            with<br>
            sponsors?<br>
            <br>
            Where is defined what belong to the project, who is
            responsible, who can<br>
            request access to this hardware, what resource can be used?<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>You obviously directed the question towards Alex and
            Stefan (rightfully so), so I won't attempt to answer these
            ones at this point.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            More generically, what is the process for a private /
            corporate entity<br>
            to register a runner to the project? (how did it work for
            this aarch64<br>
            and s390x one?)<br>
          </blockquote>
          <div><br>
          </div>
          <div>The steps are listed on the documentation.  Basically
            anyone with knowledge of the "registration token" can add
            new machines to GitLab as runners.  For the two aarch64 and
            s390x, it was a matter of following the documentation steps
            which basically involve:</div>
          <div><br>
          </div>
          <div>1) providing the hostname(s) in the inventory file</div>
          <div>2) provide the "registration token" in the vars.yml file</div>
          <div>3) running the playbooks</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            What else am I missing?<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I think you're missing the answers to all your good
            questions :).</div>
          <div><br>
          </div>
          <div>And I understand that are a lot of them (from everyone,
            including myself).  The dilemma here is: should we activate
            the machines already available, and learn in practice,
            what's missing?  I honestly believe we should.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>IMHO we should merge the minimum possible to start using the
      existing machines, then address the questions (good questions,
      btw) raised by Philippe as needed.<br>
    </p>
    <p>Thanks!</p>
    <p>- Wainer<br>
    </p>
    <blockquote type="cite"
cite="mid:CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Thanks,</div>
          <div>- Clr.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Thanks,<br>
            <br>
            Phil.<br>
            <br>
            &gt; This introduces those jobs,<br>
            &gt; which are a mapping of custom scripts used for the same
            purpose.<br>
            &gt; <br>
            &gt; Signed-off-by: Cleber Rosa &lt;<a
              href="mailto:crosa@redhat.com" target="_blank"
              moz-do-not-send="true">crosa@redhat.com</a>&gt;<br>
            &gt; ---<br>
            &gt;  .gitlab-ci.d/custom-runners.yml | 208
            ++++++++++++++++++++++++++++++++<br>
            &gt;  1 file changed, 208 insertions(+)<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------26BC45211DFFEBD220739C44--


