Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E36FC720
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:53:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMqP-0006XT-0W; Tue, 09 May 2023 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwMqN-0006XE-9a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:53:27 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwMqJ-00018L-W0
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:53:27 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so34682995e87.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683636802; x=1686228802;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u0+Vj6D+n/VuLueHmCGkIzOiBPQ9S31AFzn22FbbIz4=;
 b=FCnvvGl67FSjrkQwDrJZw3AbM98YJBAcNg1be8mKoWlj6jln53rfVzwAfMWXiSnw2o
 lTEQ4m1H9ki+SUvEqp0DTPO20FGTpmB0yGu4b7uhBRydoUNtRGPDYJrkdQAQQupwXdJy
 pQQeHRfYySwlqc6HKOCQJKhbfC6RKCAwPzjA+N4XO20Nl5fYnKW2fe2yxuY907HUPKjO
 fEl3O3XNstQgINOBN9MUQl/WXEpQs8ELgktFU7mB5RkW+N02bCUMOevv5hoQOAuzLBsz
 KuXrZz1kGhFkswTgnEaE07yGs+Nz5lYVFNp0BnPVxMN9OJZWGq3FfaKbU4A1FPPSme2X
 LJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636802; x=1686228802;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0+Vj6D+n/VuLueHmCGkIzOiBPQ9S31AFzn22FbbIz4=;
 b=hc1DAWlzqOFx1FUDRzrpD6xBmhCVak8hsEgJ79ID6TdF0Pya3aBq5q2mSXlykZegHE
 tveGkCk7Ib6oidddpOguW1xP9fdBffCVWzdhbNInIaMo74fB/7sZPsOhgERsQ8Y6l6Tz
 +XWlfQWFHLetefynSPo3QNWx3kaaJnTHcDJbKFuHzKZXiZhKz5FuWDVPqp0eZ7XDSqsH
 pILQ0BMI7Fjcfv+oqY3bwNvRBB5+nR5FRqGI7dV2d3JrWPTaXuj0q+wNtr0xYG2vmf69
 dBjtj3Nyv6cdQ9Jo0qRmKV/v+6nC0I/FcM07JzHm1xDBIiXJsZIb9gQBET6pcdqxAacO
 hyXA==
X-Gm-Message-State: AC+VfDwhY0U7n7llL/7ZfFwtM50OJwQe5lYYFBHbgIi16xpkp2DdP/zK
 8DcP7aNithtNCw8tIkvw87zVga/0869MRPQhJnQ=
X-Google-Smtp-Source: ACHHUZ4cc/VQ4erxEwpVKxXDCV4lc56/6rjcqJRDP9LAe+9IazJw+ts4/iqa9dWd52Zf5jWRx+H05+uG+KRgV8hHBwI=
X-Received: by 2002:a2e:9cc2:0:b0:295:a8e6:6b15 with SMTP id
 g2-20020a2e9cc2000000b00295a8e66b15mr795954ljj.4.1683636801844; Tue, 09 May
 2023 05:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230503081911.119168-1-aesteve@redhat.com>
 <20230503081911.119168-5-aesteve@redhat.com>
 <CAJ+F1CJd_wdTuQgspE7=mPhgbvx9VDrd3iejcTDLquC8PBjj1A@mail.gmail.com>
 <CADSE00JpwVFQqshm-XyMzmQ4_hciavsKox6sj8AAeBTQbk=Kxg@mail.gmail.com>
In-Reply-To: <CADSE00JpwVFQqshm-XyMzmQ4_hciavsKox6sj8AAeBTQbk=Kxg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 May 2023 16:53:09 +0400
Message-ID: <CAJ+F1CJKr_MocGs92-4fWXP_6MCPe_c8hKUa4iqGxB=rsrv9+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvhost-user: add write_msg cb to dev struct
To: Albert Esteve <aesteve@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000813a5705fb423da4"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--000000000000813a5705fb423da4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 9, 2023 at 3:17=E2=80=AFPM Albert Esteve <aesteve@redhat.com> w=
rote:

>
> Hi!
>
> On Tue, May 9, 2023 at 12:12=E2=80=AFPM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi
>>
>> On Wed, May 3, 2023 at 12:21=E2=80=AFPM Albert Esteve <aesteve@redhat.co=
m> wrote:
>>
>>> Add vu_write_msg_cb type as a member of the VuDev
>>> struct.
>>>
>>> In order to interact with the virtio-dmabuf
>>> API, vhost-user backends have available a special
>>> message type that can be sent to the frontend
>>> in Qemu, in order to add, lookup, or remove
>>> entries.
>>>
>>> To send these messages and avoid code replication,
>>> backends will need the write_msg method to be exposed
>>> to them, similarly to how the read_msg is for
>>> receiving messages.
>>>
>>
>> I think read_msg was introduced to blend libvhost-user IO to qemu
>> mainloop & coroutine. Is that what you have in mind for write_msg?
>>
>
> Uhm, after grep'ing, it seems that read_msg is only used within
> libvhost-user source, so I guess it is mainly used to
> allow backends to provide custom methods? Maybe I am misunderstanding.
>
> But my idea for adding `write_msg` is exposing the write method (i.e.,
> vu_message_write) to the backends,
> without having the function signature in the header. This way, vhost-user
> backends that want to write a message,
> can just use `dev->write_msg(args...)`. Which would be equivalent to
> `vu_message_write(args...)` if this
> was visible for others.
>


Imho it's better to introduce a normal function in that case, that is
simply export vu_message_write_default().


> Another option could be to have a specific public method sending the
> requests to the frontend, that
> internally, would use `vu_message_write`. But since we introduce three ne=
w
> message types that
> backends can send, I thought adding different methods would be a bit too
> verbose.
>

Actually, exposing higher-level methods to send specific messages is more
correct imho.


>>
>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>> ---
>>>  subprojects/libvhost-user/libvhost-user.c |  1 +
>>>  subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++
>>>  2 files changed, 17 insertions(+)
>>>
>>> diff --git a/subprojects/libvhost-user/libvhost-user.c
>>> b/subprojects/libvhost-user/libvhost-user.c
>>> index 6b4b721225..c50b353915 100644
>>> --- a/subprojects/libvhost-user/libvhost-user.c
>>> +++ b/subprojects/libvhost-user/libvhost-user.c
>>> @@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,
>>>      dev->sock =3D socket;
>>>      dev->panic =3D panic;
>>>      dev->read_msg =3D read_msg ? read_msg : vu_message_read_default;
>>> +    dev->write_msg =3D vu_message_write;
>>>
>>
>> You are not making it customizable? And the callback is not used.
>>
>
> Making it customizable would require changing the signature of `vu_init`,
> and I did not see
> the need for this usecase. I just want to expose the static method to the
> backends.
>
>
ok


> The callback is not used because there is still no virtio device to use
> it. But this whole
> infrastructure will be nice to have for the next device that would requir=
e
> it (e.g., virtio-video).
>
> In that regard, this commit could be skipped from the PATCH and just
> change it once there
> is a virtio device that needs to send a `VHOST_USER_BACKEND_SHARED_OBJECT=
`
> message. Basically, I needed it for testing (just had a dummy vhost-user
> backend that I used for
> sending messages), and then decided to keep it. But maybe having a simple=
r
> patch is better.
>
>
>>
>>
>>>      dev->set_watch =3D set_watch;
>>>      dev->remove_watch =3D remove_watch;
>>>      dev->iface =3D iface;
>>> diff --git a/subprojects/libvhost-user/libvhost-user.h
>>> b/subprojects/libvhost-user/libvhost-user.h
>>> index 784db65f7c..f5d7162886 100644
>>> --- a/subprojects/libvhost-user/libvhost-user.h
>>> +++ b/subprojects/libvhost-user/libvhost-user.h
>>> @@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev,
>>> uint64_t features);
>>>  typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,
>>>                                    int *do_reply);
>>>  typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg
>>> *vmsg);
>>> +typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg
>>> *vmsg);
>>>  typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool
>>> started);
>>>  typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int
>>> qidx);
>>>  typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_t
>>> len);
>>> @@ -429,6 +430,21 @@ struct VuDev {
>>>       */
>>>      vu_read_msg_cb read_msg;
>>>
>>> +    /*
>>> +     * @write_msg: custom method to write vhost-user message
>>> +     *
>>> +     * Write data to vhost_user socket fd from the passed
>>> +     * VhostUserMsg *vmsg struct.
>>> +     *
>>> +     * For the details, please refer to vu_message_write in
>>> libvhost-user.c
>>> +     * which will be used by default when calling vu_unit.
>>> +     * No custom method is allowed.
>>>
>>
>> "No custom method is allowed"?
>>
>
> I meant that I am not making it customizable (from your previous point),
> as opposed to the `read_msg` method.
>
>
>>
>>
>>> +     *
>>> +     * Returns: true if vhost-user message successfully sent, false
>>> otherwise.
>>> +     *
>>> +     */
>>> +    vu_write_msg_cb write_msg;
>>> +
>>>
>>
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000813a5705fb423da4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 3:17=E2=80=
=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"l=
tr"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:RedHatText,sa=
ns-serif;margin:0px;padding:0px;font-size:14px">Hi!</p></div></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, May 9, 2023 at 12:12=E2=80=AFPM Marc-Andr=C3=A9 Lureau &lt;<a href=3D=
"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 3, 2023 at 12:21=
=E2=80=AFPM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=
=3D"_blank">aesteve@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Add vu_write_msg_cb type as a member of the V=
uDev<br>
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
ic messages is more correct imho.</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--000000000000813a5705fb423da4--

