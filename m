Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF23B6A77
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:35:17 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyuS-0003at-DY
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lxytP-0002uU-MH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lxytJ-0000pz-TA
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624916042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1195kMvei4yK96/nWLfFB7ZIldapW3PwzdG1+T+sbM=;
 b=O8JcfAn4304vjAr7zfEiAjoQIO6Bl56GvmUOYliZSr1AvbHQWe2jyW3RWFYrZaZCNOS67V
 CIytSYIjvf7VYO2LccYoX87ixQxdIy9YQMe6pDFtPgwqrjqPAs7gkDfHfRJSLgptzcKLOw
 TR4+n/6HjnisHfGHuhV8ZsC9wOl+eFU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-FZlN0or2PC2Ch5nhh45uVg-1; Mon, 28 Jun 2021 17:33:58 -0400
X-MC-Unique: FZlN0or2PC2Ch5nhh45uVg-1
Received: by mail-qk1-f199.google.com with SMTP id
 f10-20020a05620a15aab02903b3210e44dcso13298111qkk.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=OGWKmi9WCHTEfgsfYobQPw14Ig00RtkneyyAVnbDKjE=;
 b=lVcLFCoICAfY6YnlNN7CieoyDHMabAOy7VJPY3dawwdLFGDDvCoSGqO8x2ZXVqYTdh
 usbP+U2fY6tJm5o8/xA0LmOBq6tqd5oC7rV5sZba/MiU3EHTXF/QeusdEWJJfpZroAph
 Vw37rcKQRobZ+EQEY/m1cKZmWZfKMtVJyswtmXjQc+XHn+/dFbD/F/JBVZFN49BpJLjB
 841BqX5nOpiwMnFUZePNzvHCRNpnuaFTfrJ6t7WAdu6aYCthu+yF/2Vs00rbXpghjPYX
 HjE4I5MAOg4TX0pMV5U//Oc+i8+IKmIqTOlcyjeFxKmVZEv0kcQ0eUQKEgGlrHuzTQ3c
 Cy3w==
X-Gm-Message-State: AOAM530QuJebq+7/lPTOQeh+TMwGKnZyhHRGIL6Qa6dcNKOfqkhA/+fL
 T1OdOAtYGvNxepl8rlDZ1K/cIDnOeuWZCzp1ZDjtbHyZc/FsOtD+MuHuaFxixhNamkc9kGzf0iV
 9stILAPH4KZsRNvA=
X-Received: by 2002:a37:9ecd:: with SMTP id
 h196mr24445139qke.395.1624916038205; 
 Mon, 28 Jun 2021 14:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUqLrscdhha18XagmX4Vq5ELIYWBW9WJAuyY3/3m5zvuoA+22kT65I1FTCVeXJl/U8chGEww==
X-Received: by 2002:a37:9ecd:: with SMTP id
 h196mr24445127qke.395.1624916038026; 
 Mon, 28 Jun 2021 14:33:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:18d:8a00:ab70:168b:43e0:32fd:16c7])
 by smtp.gmail.com with ESMTPSA id w185sm11281054qkd.30.2021.06.28.14.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:33:57 -0700 (PDT)
Subject: Re: QEMU hosting
To: Thomas Markey <admin@fosshost.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
 <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
 <e8513f65-a94f-7944-587c-6a7462a3f7a5@redhat.com>
 <19ca4ff0-55b7-0bfd-624a-85962fee3bcc@redhat.com>
 <LO2P123MB2605ABB192A2375FC06314F6C80B9@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <f14106ea-d012-c88a-f984-05c49d7d7616@redhat.com>
Date: Mon, 28 Jun 2021 17:33:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <LO2P123MB2605ABB192A2375FC06314F6C80B9@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------3A2D177018A13DDF93779CB4"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------3A2D177018A13DDF93779CB4
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 6/20/21 12:14 PM, Thomas Markey wrote:
> Dear all
>
> Would it be possible, may I ask, for the QEMU website to be updated to 
> show that Fosshost is supporting the project?
>
> The fosshost logo with a link back to https://fosshost.org 
> <https://fosshost.org> will be more than sufficient, or just a link in 
> footer / sponsor's page (if you have one).
>
> In addition, we're currently experiencing significant growth and are 
> looking at the more established/larger projects we work with, to 
> understand whether there may be an opportunity for financial 
> donation.  In short, we need to take on full time members of staff in 
> order to run our service.  Your time and attention in this would be 
> greatly appreciated if you could afford it to us.
>
> I look forward to hearing from you.
>
> Kind regards,
>

Hi Thomas,


I don't see why not.  In any case, I've opened an issue:


https://gitlab.com/qemu-project/qemu-web/-/issues/2


To keep track of the resolution of your request.


Thanks,

- Cleber.



--------------3A2D177018A13DDF93779CB4
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/20/21 12:14 PM, Thomas Markey
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:LO2P123MB2605ABB192A2375FC06314F6C80B9@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        Dear all</div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        Would it be possible, may I ask, for the QEMU website to be
        updated to show that Fosshost is supporting the project?</div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        The fosshost logo with a link back to <a
          href="https://fosshost.org" id="LPlnk" moz-do-not-send="true">https://fosshost.org</a>
        will be more than sufficient, or just a link in footer /
        sponsor's page (if you have one).<br>
      </div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        In addition, we're currently experiencing significant growth and
        are looking at the more established/larger projects we work
        with, to understand whether there may be an opportunity for
        financial donation.  In short, we need to take on full time
        members of staff in order to run our service.  Your time and
        attention in this would be greatly appreciated if you could
        afford it to us.</div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        I look forward to hearing from you.</div>
      <div style="font-family: Arial, Helvetica, sans-serif; font-size:
        11pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div>
        <div id="Signature">
          <div>
            <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
              font-size:12pt; color:rgb(0,0,0)">
              Kind regards,<br>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Thomas,</p>
    <p><br>
    </p>
    <p>I don't see why not.  In any case, I've opened an issue:</p>
    <p><br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu-web/-/issues/2">https://gitlab.com/qemu-project/qemu-web/-/issues/2</a></p>
    <p><br>
    </p>
    <p>To keep track of the resolution of your request.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>- Cleber.<br>
    </p>
    <br>
  </body>
</html>

--------------3A2D177018A13DDF93779CB4--


