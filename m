Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22B6FDDD2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:32:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiy3-0007WI-Hq; Wed, 10 May 2023 08:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pwiy0-0007Vm-HO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pwixy-0001Pg-5n
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U22N0k7pRWCuO2yReGOPTMvJKS1aM3UFiP1KFfcX+AI=;
 b=a+tgk1R/Qfk09UxOdpdRv383WQkgWRIXQpk8A9hWsrnMBG7At2l9G/+W4ixUnP15h3lcis
 ep7GGuD1f0+vh5mGnVyNRmcNm8wz+Q/BQ4gBBxzTa0ydD3sMch/BFXXz+a0yj+x/rkJwHZ
 yon2mE+AaP5M0W2L5lEEZNtx+NUDvL4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-QxANGftHO9Wue2xyqTLhPw-1; Wed, 10 May 2023 08:30:43 -0400
X-MC-Unique: QxANGftHO9Wue2xyqTLhPw-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-24e116d1a05so6929594a91.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683721842; x=1686313842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U22N0k7pRWCuO2yReGOPTMvJKS1aM3UFiP1KFfcX+AI=;
 b=lL9Aq/SVr9nKwLsm0H4e1YBz7f8NbAYPa85FGqDyaIQX6blmEW4SHb5JWzcUY+nUjh
 PJ2j7BtG3J71KOmvCzZJAkhHyDPyweZkbIbX108e1MZLEKSWNyvfxxzltA8LzPO1lbXl
 Lri2B767/cw7PSIK2nhMVJX80R0S85Ff6nXAK/uOrGBrLYkLxplM9k45288pAMC4ba7s
 cqgHixbnJJN/3umL+BlO7OB5LPxLnCReCX4AZMtsqqHmu6ob/caXD5i0Qoe1pO6uakP0
 P/FEwP6/Dj2oyDm/yEAtRnVxoceT4yJDi9ChLAxYkIJ+lzU5PQCISuqsfmJD3iyuVghm
 /wHA==
X-Gm-Message-State: AC+VfDzsnHi8BtTVWFwjgtr6amPB3AWCOwtlgwHHkoLDq3aorrklUkIa
 MhX50JnqfhgR6FZZfL0lxc8Ic7rXdHR9hG+P97hzwWBG/Va53g3fqSpgF+FpXMj2LUFxmO628Mu
 aNejmgI82z9Dsl2vkgSTTRwB+EEsQ+n4=
X-Received: by 2002:a17:90b:3757:b0:247:afed:6d62 with SMTP id
 ne23-20020a17090b375700b00247afed6d62mr16843130pjb.46.1683721842310; 
 Wed, 10 May 2023 05:30:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6s93I/6FAcZ0UA9rG0gF7kSL8ZMtaxv4DvXVvCDQPVmrm+WwVvNiWYHBV0iV7fHQ5ciRSPqMfWk4H+VA7C1hk=
X-Received: by 2002:a17:90b:3757:b0:247:afed:6d62 with SMTP id
 ne23-20020a17090b375700b00247afed6d62mr16843109pjb.46.1683721841985; Wed, 10
 May 2023 05:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230503081911.119168-1-aesteve@redhat.com>
 <20230503081911.119168-5-aesteve@redhat.com>
 <CAJ+F1CJd_wdTuQgspE7=mPhgbvx9VDrd3iejcTDLquC8PBjj1A@mail.gmail.com>
 <CADSE00JpwVFQqshm-XyMzmQ4_hciavsKox6sj8AAeBTQbk=Kxg@mail.gmail.com>
 <CAJ+F1CJKr_MocGs92-4fWXP_6MCPe_c8hKUa4iqGxB=rsrv9+w@mail.gmail.com>
In-Reply-To: <CAJ+F1CJKr_MocGs92-4fWXP_6MCPe_c8hKUa4iqGxB=rsrv9+w@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 10 May 2023 14:30:30 +0200
Message-ID: <CADSE00Lv1yLvokfGZAj=rmOjNPDWZOP3dF9B19Q2_UQWQHeqCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvhost-user: add write_msg cb to dev struct
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004ae18905fb560abb"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004ae18905fb560abb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 2:53=E2=80=AFPM Marc-Andr=C3=A9 Lureau <marcandre.lu=
reau@gmail.com>
wrote:

> Hi
>
> On Tue, May 9, 2023 at 3:17=E2=80=AFPM Albert Esteve <aesteve@redhat.com>=
 wrote:
>
>>
>> Hi!
>>
>> On Tue, May 9, 2023 at 12:12=E2=80=AFPM Marc-Andr=C3=A9 Lureau <
>> marcandre.lureau@gmail.com> wrote:
>>
>>> Hi
>>>
>>> On Wed, May 3, 2023 at 12:21=E2=80=AFPM Albert Esteve <aesteve@redhat.c=
om>
>>> wrote:
>>>
>>>> Add vu_write_msg_cb type as a member of the VuDev
>>>> struct.
>>>>
>>>> In order to interact with the virtio-dmabuf
>>>> API, vhost-user backends have available a special
>>>> message type that can be sent to the frontend
>>>> in Qemu, in order to add, lookup, or remove
>>>> entries.
>>>>
>>>> To send these messages and avoid code replication,
>>>> backends will need the write_msg method to be exposed
>>>> to them, similarly to how the read_msg is for
>>>> receiving messages.
>>>>
>>>
>>> I think read_msg was introduced to blend libvhost-user IO to qemu
>>> mainloop & coroutine. Is that what you have in mind for write_msg?
>>>
>>
>> Uhm, after grep'ing, it seems that read_msg is only used within
>> libvhost-user source, so I guess it is mainly used to
>> allow backends to provide custom methods? Maybe I am misunderstanding.
>>
>> But my idea for adding `write_msg` is exposing the write method (i.e.,
>> vu_message_write) to the backends,
>> without having the function signature in the header. This way, vhost-use=
r
>> backends that want to write a message,
>> can just use `dev->write_msg(args...)`. Which would be equivalent to
>> `vu_message_write(args...)` if this
>> was visible for others.
>>
>
>
> Imho it's better to introduce a normal function in that case, that is
> simply export vu_message_write_default().
>
>
>> Another option could be to have a specific public method sending the
>> requests to the frontend, that
>> internally, would use `vu_message_write`. But since we introduce three
>> new message types that
>> backends can send, I thought adding different methods would be a bit too
>> verbose.
>>
>
> Actually, exposing higher-level methods to send specific messages is more
> correct imho.
>

Then I will do that, thanks!


>
>
>>>
>>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>>> ---
>>>>  subprojects/libvhost-user/libvhost-user.c |  1 +
>>>>  subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++
>>>>  2 files changed, 17 insertions(+)
>>>>
>>>> diff --git a/subprojects/libvhost-user/libvhost-user.c
>>>> b/subprojects/libvhost-user/libvhost-user.c
>>>> index 6b4b721225..c50b353915 100644
>>>> --- a/subprojects/libvhost-user/libvhost-user.c
>>>> +++ b/subprojects/libvhost-user/libvhost-user.c
>>>> @@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,
>>>>      dev->sock =3D socket;
>>>>      dev->panic =3D panic;
>>>>      dev->read_msg =3D read_msg ? read_msg : vu_message_read_default;
>>>> +    dev->write_msg =3D vu_message_write;
>>>>
>>>
>>> You are not making it customizable? And the callback is not used.
>>>
>>
>> Making it customizable would require changing the signature of `vu_init`=
,
>> and I did not see
>> the need for this usecase. I just want to expose the static method to th=
e
>> backends.
>>
>>
> ok
>
>
>> The callback is not used because there is still no virtio device to use
>> it. But this whole
>> infrastructure will be nice to have for the next device that would
>> require it (e.g., virtio-video).
>>
>> In that regard, this commit could be skipped from the PATCH and just
>> change it once there
>> is a virtio device that needs to send a `VHOST_USER_BACKEND_SHARED_OBJEC=
T`
>> message. Basically, I needed it for testing (just had a dummy vhost-user
>> backend that I used for
>> sending messages), and then decided to keep it. But maybe having a
>> simpler patch is better.
>>
>>
>>>
>>>
>>>>      dev->set_watch =3D set_watch;
>>>>      dev->remove_watch =3D remove_watch;
>>>>      dev->iface =3D iface;
>>>> diff --git a/subprojects/libvhost-user/libvhost-user.h
>>>> b/subprojects/libvhost-user/libvhost-user.h
>>>> index 784db65f7c..f5d7162886 100644
>>>> --- a/subprojects/libvhost-user/libvhost-user.h
>>>> +++ b/subprojects/libvhost-user/libvhost-user.h
>>>> @@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev,
>>>> uint64_t features);
>>>>  typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,
>>>>                                    int *do_reply);
>>>>  typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg
>>>> *vmsg);
>>>> +typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg
>>>> *vmsg);
>>>>  typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool
>>>> started);
>>>>  typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int
>>>> qidx);
>>>>  typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_=
t
>>>> len);
>>>> @@ -429,6 +430,21 @@ struct VuDev {
>>>>       */
>>>>      vu_read_msg_cb read_msg;
>>>>
>>>> +    /*
>>>> +     * @write_msg: custom method to write vhost-user message
>>>> +     *
>>>> +     * Write data to vhost_user socket fd from the passed
>>>> +     * VhostUserMsg *vmsg struct.
>>>> +     *
>>>> +     * For the details, please refer to vu_message_write in
>>>> libvhost-user.c
>>>> +     * which will be used by default when calling vu_unit.
>>>> +     * No custom method is allowed.
>>>>
>>>
>>> "No custom method is allowed"?
>>>
>>
>> I meant that I am not making it customizable (from your previous point),
>> as opposed to the `read_msg` method.
>>
>>
>>>
>>>
>>>> +     *
>>>> +     * Returns: true if vhost-user message successfully sent, false
>>>> otherwise.
>>>> +     *
>>>> +     */
>>>> +    vu_write_msg_cb write_msg;
>>>> +
>>>>
>>>
>>>
>>> --
>>> Marc-Andr=C3=A9 Lureau
>>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--0000000000004ae18905fb560abb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font=
-family:RedHatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-=
size:14px"><br></p></div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 2:53=E2=80=AFPM=
 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">m=
arcandre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ma=
y 9, 2023 at 3:17=E2=80=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@re=
dhat.com" target=3D"_blank">aesteve@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><br clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr"><p style=3D"c=
olor:rgb(0,0,0);font-family:RedHatText,sans-serif;margin:0px;padding:0px;fo=
nt-size:14px">Hi!</p></div></div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 12:12=E2=80=
=AFPM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.c=
om" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 3, 2023 at 12:21=E2=80=AFPM Albert Esteve &lt;<=
a href=3D"mailto:aesteve@redhat.com" target=3D"_blank">aesteve@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ad=
d vu_write_msg_cb type as a member of the VuDev<br>
struct.<br>
<br>
In order to interact with the virtio-dmabuf<br>
API, vhost-user backends have available a special<br>
message type that can be sent to the frontend<br>
in Qemu, in order to add, lookup, or remove<br>
entries.<br>
<br>
To send these messages and avoid code replication,<br>
backends will need the write_msg method to be exposed<br>
to them, similarly to how the read_msg is for<br>
receiving messages.<br></blockquote><div><br></div><div>I think read_msg wa=
s introduced to blend libvhost-user IO to qemu mainloop &amp; coroutine. Is=
 that what you have in mind for write_msg?<br></div></div></div></blockquot=
e><div><br></div><div>Uhm, after grep&#39;ing, it seems that read_msg is on=
ly used within libvhost-user source, so I guess it is mainly used to</div><=
div>allow backends to provide custom methods? Maybe I am misunderstanding.<=
/div><div><br></div><div>But my idea for adding `write_msg` is exposing the=
 write method (i.e., vu_message_write) to the backends,</div><div>without h=
aving the function signature in the header. This way, vhost-user backends t=
hat want to write a message,</div><div>can just use `dev-&gt;write_msg(args=
...)`. Which would be equivalent to `vu_message_write(args...)` if this</di=
v><div>was visible for others.</div></div></div></blockquote><div><br></div=
><div><br></div><div>Imho it&#39;s better to introduce a normal function in=
 that case, that is simply export vu_message_write_default().<br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><div><br></div><div>Another option could be t=
o have a specific public method sending the requests to the frontend, that<=
/div><div>internally, would use `vu_message_write`. But since we introduce =
three new message types that</div><div>backends can send, I thought adding =
different methods would be a bit too verbose.</div></div></div></blockquote=
><div><br></div><div>Actually, exposing higher-level methods to send specif=
ic messages is more correct imho.</div></div></div></blockquote><div><br></=
div><div>Then I will do that, thanks!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
---<br>
=C2=A0subprojects/libvhost-user/libvhost-user.c |=C2=A0 1 +<br>
=C2=A0subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++<br>
=C2=A02 files changed, 17 insertions(+)<br>
<br>
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c<br>
index 6b4b721225..c50b353915 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.c<br>
+++ b/subprojects/libvhost-user/libvhost-user.c<br>
@@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;sock =3D socket;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;panic =3D panic;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;read_msg =3D read_msg ? read_msg : vu_message_r=
ead_default;<br>
+=C2=A0 =C2=A0 dev-&gt;write_msg =3D vu_message_write;<br></blockquote><div=
><br></div><div>You are not making it customizable? And the callback is not=
 used.<br></div></div></div></blockquote><div><br></div><div>Making it cust=
omizable would require changing the signature of `vu_init`, and I did not s=
ee</div><div>the need for this usecase. I just want to expose the static me=
thod to the backends.</div><div><br></div></div></div></blockquote><div><br=
></div><div>ok</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div=
>The callback is not used because there is still no virtio device to use it=
. But this whole</div><div>infrastructure will be nice to have for the next=
 device that would require it (e.g., virtio-video).</div><div><br></div><di=
v>In that regard, this commit could be skipped from the PATCH and just chan=
ge it once there</div><div>is a virtio device that needs to send a `VHOST_U=
SER_BACKEND_SHARED_OBJECT`</div><div>message. Basically, I needed it for te=
sting (just had a dummy vhost-user backend that I used for</div><div>sendin=
g messages), and then decided to keep it. But maybe having a simpler patch =
is better.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0dev-&gt;set_watch =3D set_watch;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;remove_watch =3D remove_watch;<br>
=C2=A0 =C2=A0 =C2=A0dev-&gt;iface =3D iface;<br>
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvho=
st-user/libvhost-user.h<br>
index 784db65f7c..f5d7162886 100644<br>
--- a/subprojects/libvhost-user/libvhost-user.h<br>
+++ b/subprojects/libvhost-user/libvhost-user.h<br>
@@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev, uint64_=
t features);<br>
=C2=A0typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *do_reply);<br>
=C2=A0typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg *v=
msg);<br>
+typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg)=
;<br>
=C2=A0typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool s=
tarted);<br>
=C2=A0typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int qi=
dx);<br>
=C2=A0typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_=
t len);<br>
@@ -429,6 +430,21 @@ struct VuDev {<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0vu_read_msg_cb read_msg;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* @write_msg: custom method to write vhost-user messag=
e<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Write data to vhost_user socket fd from the passed<b=
r>
+=C2=A0 =C2=A0 =C2=A0* VhostUserMsg *vmsg struct.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* For the details, please refer to vu_message_write in=
 libvhost-user.c<br>
+=C2=A0 =C2=A0 =C2=A0* which will be used by default when calling vu_unit.<=
br>
+=C2=A0 =C2=A0 =C2=A0* No custom method is allowed.<br></blockquote><div><b=
r></div><div>&quot;No custom method is allowed&quot;?</div></div></div></bl=
ockquote><div><br></div><div>I meant that I am not making it customizable (=
from your previous point),</div><div>as opposed to the `read_msg` method.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Returns: true if vhost-user message successfully sen=
t, false otherwise.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 vu_write_msg_cb write_msg;<br>
+<br></blockquote><div><br></div></div><br><span>-- </span><br><div dir=3D"=
ltr">Marc-Andr=C3=A9 Lureau<br></div></div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br><span>-- </span><br><div dir=3D"lt=
r">Marc-Andr=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--0000000000004ae18905fb560abb--


