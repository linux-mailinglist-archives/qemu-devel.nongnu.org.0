Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E474EB037
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:25:00 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDiN-0006y5-5z
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:24:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skagan@redhat.com>) id 1nZCpJ-0006yM-Hb
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <skagan@redhat.com>) id 1nZCpH-0005yS-Nb
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648564081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=UrwqE5UTqynaLnMoWs+GsUnTU0L4cMQIJkDnnTzA39Y=;
 b=RcPnsBuxUpM36ZmM747pZMKyuHOZYfsFfPKuJOBBcgMt5HSjcwP58idIcJQBODlq4oGUF0
 hW9vE5bimpegicJo7aG+SwnUrdcGyucJGLIMzkLjZ5rBLMDF2l7t9GicHEDBFNaYiu4osQ
 Rmh0IjBou5DQaItR1yuADw5zyxqC9l0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-H9K72u9SPkKe5oaNY3CE9Q-1; Tue, 29 Mar 2022 10:26:42 -0400
X-MC-Unique: H9K72u9SPkKe5oaNY3CE9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 l19-20020adf9f13000000b00203f7f64c7bso5053598wrf.18
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UrwqE5UTqynaLnMoWs+GsUnTU0L4cMQIJkDnnTzA39Y=;
 b=I1N/ub5e45yYqN5/Sk270GL6lT8aT3NTljKXCwkKjHHwLrXiY9sitQ2IgfrFslqf5G
 IvXpjmzOyiAOpx0WnVNU9X19tOJ3CekN6iz+CyYbgk0AigcpDMKFjuXMOkIhJdwPEE0j
 cP8oHYoVVaZJhA384n0KGZ4SWLiBgusNbG4FKBVDzJInBQrz0MsfTxE/4cvxkEM4GTZg
 FsVmv1V5hFKMsuO996g9ju/V0mjqAXKKuofNF+K+mT358o0M9KlHPkL3VFITRvoyolew
 pjfBtjVmLgWkAs2peU3vPFX5aBcZHY5bHgVV/NaxjN9E4E6RZtZPZLPPJ7LhRNIRgKEM
 HSNA==
X-Gm-Message-State: AOAM53112j/YM8pB4hq4HJT67fwCiRH39XcOKhk6I4zNT4yLGLO+ARmu
 s9p/pr2L20gOSLSUyW5LxHPQLUuLBKWQUbW/dfp9+rgcsKMNDbeIK7+NHCZTcI4ZkUmBB/k+61A
 7It0u1it4hUpWpORRZMV4+aTJDgWhkiI=
X-Received: by 2002:a5d:64e5:0:b0:205:9d96:6cf9 with SMTP id
 g5-20020a5d64e5000000b002059d966cf9mr26127090wri.117.1648564001239; 
 Tue, 29 Mar 2022 07:26:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQdcwMt85LWG+jnphoazfldrPaCUDsRoiZAlPjZfWxAvtl8pKUd62YF2sGXdj700d7uIroa9miZsSEwf+xoa0=
X-Received: by 2002:a5d:64e5:0:b0:205:9d96:6cf9 with SMTP id
 g5-20020a5d64e5000000b002059d966cf9mr26127055wri.117.1648564000837; Tue, 29
 Mar 2022 07:26:40 -0700 (PDT)
MIME-Version: 1.0
From: Shelly Kagan <skagan@redhat.com>
Date: Tue, 29 Mar 2022 17:26:30 +0300
Message-ID: <CAMUS3ta+RFL1M+esUzy34WpB-MOO4ofKdsPiHOUoPyBXF2GoTw@mail.gmail.com>
Subject: FSFreeze on Windows VM
To: qemu-devel@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=skagan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a8e98105db5c37b1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=skagan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_IMAGE_ONLY_32=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Mar 2022 11:23:03 -0400
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

--000000000000a8e98105db5c37b1
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm having some weird behavior with fsfreeze in windows VM.
I run the fsfreeze and it returns:
`error: Guest agent is not responding: Guest agent not available for now`

but checking the status returned frozen, rerunning it again returns that
the command is not enabled (expected since the freeze occurs)

I checked the fsstatus and it keeps returning `frozen` even after 10
seconds (from my understanding the freeze in windows vm is limited to 10
seconds by default by the VSS. No way to change this default from my
understanding, is it true?) Shouldn't the status return thawed if the VSS
no longer keeps the freeze state?

After a minute I did the thaw and it returned error:
`error: internal error: unable to execute QEMU agent command
'guest-fsfreeze-thaw': couldn't hold writes: fsfreeze is limited up to 10
seconds:`

but the fsstatus changed to thawed after that call.

My questions are:
1. Why would the fsfreeze return error about the guest agent but still
freeze the fs?
2. Why would the guest agent not respond, is there a way to make sure it is
available before the freeze command? (running the fsstatus command before
it returned without issues..)
3. Is it expected that the fsstatus will return frozen even if possibly VSS
has already thawed? and that the thaw fails but the status do change after
to thawed?

Thanks for taking the time to respond and help,
-- 

Shelly Kagan

Senior Software Engineer

Red Hat <https://www.redhat.com>
<https://www.redhat.com>

--000000000000a8e98105db5c37b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>I&#39;m having some weird behavior =
with fsfreeze in windows VM.</div><div>I run the fsfreeze and it returns:</=
div><div>`error: Guest agent is not responding: Guest agent not available f=
or now`</div><div><br>but checking the status returned frozen, rerunning it=
 again returns that the command is not enabled (expected since the freeze o=
ccurs)</div><div><br>I checked the fsstatus and it keeps returning `frozen`=
 even after 10 seconds (from my understanding=C2=A0the freeze in windows vm=
 is limited to 10 seconds by default by the VSS. No way to change this defa=
ult=C2=A0from my understanding, is it true?) Shouldn&#39;t the status retur=
n thawed if the VSS no longer keeps the freeze state?</div><div><br>After a=
 minute I did the thaw and it returned error:</div><div>`error: internal er=
ror: unable to execute QEMU agent command &#39;guest-fsfreeze-thaw&#39;: co=
uldn&#39;t hold writes: fsfreeze is limited up to 10 seconds:`</div><div><b=
r></div><div>but the fsstatus changed to thawed after that call.<br></div><=
div><br></div><div>My questions are:</div><div>1. Why would the fsfreeze re=
turn error about the guest agent but still freeze the fs?</div><div>2. Why =
would the guest agent not respond, is there a way to make sure it is availa=
ble before the freeze command? (running the fsstatus=C2=A0command before it=
 returned without issues..)</div><div>3. Is it expected that the fsstatus w=
ill return frozen even if possibly VSS has already thawed? and that the tha=
w fails but the status do change after to thawed?</div><div><br></div><div>=
Thanks for taking the time to respond and help,</div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div>
        <p style=3D"font-weight:bold;margin:0;padding:0;font-size:14px;marg=
in-bottom:0;font-family:&#39;RedHatText&#39;,sans-serif">
          <span>Shelly</span> <span>Kagan</span><span style=3D"color:#aaa;m=
argin:0"></span>
        </p>
       =20
        <p style=3D"font-weight:normal;font-size:12px;margin:0px;font-famil=
y:&quot;RedHatText&quot;,sans-serif">
          <span>Senior Software Engineer</span>
        </p>
        <p style=3D"font-weight:normal;margin:0;margin-bottom:4px;font-size=
:12px;font-family:&#39;RedHatText&#39;,sans-serif">
          <a style=3D"color:#0088ce;font-size:12px;margin:0;text-decoration=
:none;font-family:&#39;RedHatText&#39;,sans-serif" href=3D"https://www.redh=
at.com" target=3D"_blank">Red Hat <span></span></a>
        </p>
    <div style=3D"margin-bottom:4px">
     =20
     =20
    </div>
   =20
   =20

    =20

   =20

    <div style=3D"margin-top:12px">
      <table border=3D"0">
        <tbody><tr>
          <td width=3D"100px"><a href=3D"https://www.redhat.com" target=3D"=
_blank"> <img src=3D"https://static.redhat.com/libs/redhat/brand-assets/2/c=
orp/logo--200.png" width=3D"90" height=3D"auto"></a> </td>
         =20
        </tr>
      </tbody></table>
    </div>

  </div></div></div></div>

--000000000000a8e98105db5c37b1--


