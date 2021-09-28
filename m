Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A824A41B3CC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:24:53 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVFuW-0002GH-Pf
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVFtC-0001NR-At
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:23:30 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVFt9-0003vj-AG
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=wmVNUR9W5R45ugSM4HnZZkwD3EHexUzY5KxekaurMUk=; b=LqT2y4f9To6zw7Ty2WwsvGx/NA
 XQLe9FdMszSRDFRH9sCL2Xh/uaWB3iodcoNDmDeRoPS8ApXbbUpUPEecMilKBcx4ZuUkLkd/OxY2V
 6HCLkzWggzNPlY1IutL1HdXx2uSzzpYBSw1e3a4+jUG7rUllEf5cnguBGn1LeOdwxh4xQUAXhET0O
 zAsRbtitIOSonjJ5uJuSJAFdulyWKzeQfHAwJXM+pUX41i9b6btPeBHqXunnAWvtU61Xe2F/JBHke
 mbNKh7DxEqROlr/2vDTtEG07PzxNVHEhqdvnYD5vG9YFrJdYZW8M6abTvW3IDSB0cr+E43PUaf6T3
 BW0VgVluQilrsk2ooMLkqyDByxhD82GkgMT2ngmkKlmROtr4ZjBxeyCj7hSbXL4jH2cf4DrdMtCic
 0JhABF4d/POC8BGSk5ytgn0VfxS3NFFQfXs/3zUFArGnHrvbjWfhYSsEFCj8zmebQCrDN4h+Nlvmv
 TIwDMJV6Ln7QB8a0ePfCDLtD8JLa/aoDhN9rTWc4xRxBiEgu5po9U4MW3Xe5T4B92bPIAUjEDRC//
 nnsTCMN8aRWpa5+pLeOIyAmTXpcF0/71A+aDm/0f8U6M20tMqubhnuqlmp7fP7dvDK+n3e/+pSuTI
 zvNIeo0V0RMvihtKQwz6nAiPxY1QFvEyndIOHhAW4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Date: Tue, 28 Sep 2021 18:23:23 +0200
Message-ID: <3048101.GpayOE22Id@silver>
In-Reply-To: <YVMS5K5ZqyZGSDxf@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <42e8b7fec3f03487e322be42ef5ca0e09fd9edea.1629638507.git.qemu_oss@crudebyte.com>
 <YVMS5K5ZqyZGSDxf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 28. September 2021 15:04:36 CEST Daniel P. Berrang=E9 wrote:
> On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian Schoenebeck wrote:
> > Implements deep auto free of arrays while retaining common C-style
> > squared bracket access.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >  include/qemu/qarray.h | 150 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> >  create mode 100644 include/qemu/qarray.h
> >=20
> > diff --git a/include/qemu/qarray.h b/include/qemu/qarray.h
> > new file mode 100644
> > index 0000000000..9885e5e9ed
> > --- /dev/null
> > +++ b/include/qemu/qarray.h
> > @@ -0,0 +1,150 @@
> >=20
> > +#ifndef QEMU_QARRAY_H
> > +#define QEMU_QARRAY_H
> > +
> > +/**
> > + * QArray provides a mechanism to access arrays in common C-style (e.g.
> > by
> > + * square bracket [] operator) in conjunction with reference variables
> > that + * perform deep auto free of the array when leaving the scope of
> > the auto + * reference variable. That means not only is the array itself
> > automatically + * freed, but also memory dynamically allocated by the
> > individual array + * elements.
> > + *
> > + * Example:
> > + *
> > + * Consider the following user struct @c Foo which shall be used as
> > scalar
> > + * (element) type of an array:
> > + * @code
> > + * typedef struct Foo {
> > + *     int i;
> > + *     char *s;
> > + * } Foo;
> > + * @endcode
> > + * and assume it has the following function to free memory allocated by
> > @c Foo + * instances:
> > + * @code
> > + * void free_foo(Foo *foo) {
> > + *     free(foo->s);
> > + * }
> > + * @endcode
> > + * Add the following to a shared header file:
> > + * @code
> > + * DECLARE_QARRAY_TYPE(Foo);
> > + * @endcode
> > + * and the following to a C unit file:
> > + * @code
> > + * DEFINE_QARRAY_TYPE(Foo, free_foo);
> > + * @endcode
> > + * Finally the array may then be used like this:
> > + * @code
> > + * void doSomething(int n) {
> > + *     QArrayRef(Foo) foos =3D NULL;
> > + *     QARRAY_CREATE(Foo, foos, n);
> > + *     for (size_t i =3D 0; i < n; ++i) {
> > + *         foos[i].i =3D i;
> > + *         foos[i].s =3D calloc(4096, 1);
> > + *         snprintf(foos[i].s, 4096, "foo %d", i);
> > + *     }
> > + * }
>=20
> So essentially here the 'foos' variable is still a plain C array
> from POV of the caller ie it is a  'Foo *foos'

Yes, that's the main feature probably: getting rid of any (n times) manuall=
y=20
written deep-free code branches while at the same time keeping the burden l=
ow,=20
i.e. requiring to refactor as little existing code as possible, as it is st=
ill=20
a "normal" C-array from user code perspective, just with meta info prepende=
d=20
in front of the C-array that the user code however does not need to care ab=
out=20
at all:

  Contiguous Memory Space ->
  ----------------------------------------------------------
  | Array-Meta-Info | Scalar 0 | Scalar 1 | ... | Scalar n |
  ----------------------------------------------------------

  ^- QArrayFoo*     ^- Foo*

So switching between the two is just +- const_offset math.

Plus this has the positive side effect that a C-style array code is better =
to=20
the human eye.

=46or now that "Array-Meta-Info" is really just the array size, in future t=
his=20
might be extended to contain a reference count for instance. And as this=20
concept is actually generic code (a.k.a template code), you could also exte=
nd=20
this in a way where you just pull in features that you really need in user=
=20
code. I.e. if you don't need an atomic reference count at one place (and av=
oid=20
the sync overhead), don't enable it for your use case. If you need it=20
somewhere else, then enable it there.

> By QARRAY_CREATE() is actually allocating a 'QArrayFoo' which
> is a struct containing a 'size_t len' along with the 'Foo *foos'
> entry.
>=20
> This is a clever trick, and it works in the example above,
> because the code already has the length available in a
> convenient way via the 'int n' parameter.
>=20
> IMHO this makes the code less useful than it otherwise would
> be in the general case, because there are places where the code
> needs to pass around the array and its assoicated length, and
> so this with this magic hidden length, we're still left to pass
> around the length separately.
>=20
> Consider this example:
>=20
>   int open_conn(const char *hostname) {
>     SocketAddress *addrs;
>     size_t naddrs;
>     int ret =3D -1;
>     size_t i;
>=20
>     if (resolve_hostname(hostname, &addrs, &naddrs) < 0)
>         return -1;
>=20
>     for (i =3D 0; i < naddrs; i++) {
>         ...try to connect to addrs[i]...
>     }
>=20
>     ret =3D 0
>    cleanup:
>     for (i =3D 0; i < naddrs; i++) {
>        qapi_free_SocketAddress(addrs[i])
>     }
>     return ret;
>   }
>=20
> To simplify this it is deisrable to autofree the 'addrs'
> array.
>=20
> If using QArray, it still has to keep passing around the
> 'size_t naddrs' value because QArray hides the length
> field from the code.

Well no, you don't need to pass around anything, as the array length is alw=
ays=20
accessible; it is always just (compile time) constant -wordsize (-padding)=
=20
offset away from the C-array pointer. Maybe the phrasing "private" was a bi=
t=20
misleading in the QArray.h comments.

It is correct that my 9p use case so far did not need the array length info=
 by=20
means of accessing an API, for that reason I really just ommitted (yet) to =
add=20
a separate patch for that. All it would take was extending QArray.h in a wa=
y=20
like (roughly):

typedef struct _QArrayGeneric {
    size_t len;
    char first[];
} _QArrayGeneric;

/**
 * Returns the amount of scalar elements in the passed array.
 *
 * @param first - start of array
 */
size_t qarray_len(void* first)
{
    if (!first) {
        return 0;
    }
    _QArrayGeneric *arr =3D (_QArrayGeneric *) (
        ((char *)first) - offsetof(_QArrayGeneric, first)
    );
    return arr->len;
}

#define QARRAY_LEN(arr) qarray_len(arr)

And as this is generic code for all array scalar types, it would probably b=
e=20
partly placed in a separate qarray.c file.

After that change your user example would become:

  for (i =3D 0; i < QARRAY_LEN(addrs); i++) {
      ...try to connect to addrs[i]...
  }

If you want I can post a v3 with a formal patch (or two) to handle that arr=
ay=20
length API.

> If it instead just exposed the array struct explicitly, it can
> use the normal g_autoptr() declarator, and can also now just
> return the array directly since it is a single pointer
>=20
>=20
>   int open_conn(const char *hostname) {
>     g_autoptr(SocketAddressArray) addrs =3D NULL;
>     int ret =3D -1;
>     size_t i;
>=20
>     if (!(addrs =3D resolve_hostname(hostname)))
>         return -1;
>=20
>     for (i =3D 0; i < addrs.len; i++) {
>         ...try to connect to addrs.data[i]...
>     }
>=20
>     ret =3D 0
>    cleanup:
>     return ret;
>   }
>=20
>=20
> In terms of the first example, it adds an indirection to access
> the array data, but on the plus side IMHO the code is clearer
> because it uses 'g_autoptr' which is what is more in line with
> what is expected for variables that are automatically freed.
> QArrayRef() as a name doesn't make it clear that the value will
> be freed.
>=20
>    void doSomething(int n) {
>        g_autoptr(FooArray) foos =3D NULL;
>        QARRAY_CREATE(Foo, foos, n);
>        for (size_t i =3D 0; i < foos.len; ++i) {
>            foos.data[i].i =3D i;
>            foos.data[i].s =3D calloc(4096, 1);
>            snprintf(foos.data[i].s, 4096, "foo %d", i);
>        }
>    }

Well, that would destroy the intended major feature "as little refactoring =
as=20
possible". The amount of locations where you define a reference variable is=
=20
usually much smaller than the amount of code locations where you actually=20
access arrays.

Personally I would not mix in this case macros of foreign libraries (glib)=
=20
with macros of a local framework (QArray), because if for some reason one o=
f=20
the two deviate in future in a certain way, you would need to refactor a wh=
ole=20
bunch of user code. By just separating those definitions from day one, you =
can=20
avoid such future refactoring work right from the start.

As far as the terminology is concerned: probably a matter of taste. For me =
a=20
"reference" implies (either unique or shared) ownership, a "pointer" IMO=20
doesn't. And the usage of QArray alone makes it clear that an array without=
=20
any references gets automatically freed.

> I would also suggest that QARRAY_CREATE doesn't need to
> exist as a macro - callers could just use the allocator
> function directly for clearer code, if it was changed to
> return the ptr rather than use an out parameter:
>=20
>    void doSomething(int n) {
>        g_autoptr(FooArray) foos =3D foo_array_new(n);
>        for (size_t i =3D 0; i < foos.len; ++i) {
>            foos.data[i].i =3D i;
>            foos.data[i].s =3D calloc(4096, 1);
>            snprintf(foos.data[i].s, 4096, "foo %d", i);
>        }
>    }
>=20
> For this it needs to pass 2 args into the DECLARE_QARRAY_TYPE
> macro - the struct name and desired method name - basically
> the method name is the struct name in lowercase with underscores.

As you can see with patch 2, one of the movations of making this a macro wa=
s=20
the intention to increase strictness of type safety, e.g to make things lik=
e:

	void *p;
	...
	QARRAY_CREATE(FooType, p, n);

to raise a compiler error immediately, but that's not all ...

> Overall I think the goal of having an convenient sized array for
> types is good, but I think we should make it look a bit less
> magic. I think we only need the DECLARE_QARRAY_TYPE and
> DEFINE_QARRAY_TYPE macros.

=2E.. actually making it appear anything like magic was not my intention. T=
he=20
actual main reason for wrapping these things into macros is because that's=
=20
actually the only way to write generic code in C. Especially in larger=20
projects like this one I favour clear separation of API ("how to use it") f=
rom=20
its actual implementation ("how does it do it exactly").

So if you use macros for all those things from the beginning, it is far les=
s=20
likely that you will need to refactor a huge amount of user code with futur=
e=20
changes of this array framework.

> Incidentally, I'd suggest naming to be QARRAY_DECLARE_TYPE
> and QARRAY_DEFINE_TYPE.

Also a matter of taste I guess. The suggested naming DECLARE_QARRAY_TYPE() =
and=20
DEFINE_QARRAY_TYPE() reflect more natural language IMO.

> > + * @endcode
> > + */
> > +
> > +/**
> > + * Declares an array type for the passed @a scalar_type.
> > + *
> > + * This is typically used from a shared header file.
> > + *
> > + * @param scalar_type - type of the individual array elements
> > + */
> > +#define DECLARE_QARRAY_TYPE(scalar_type) \
> > +    typedef struct QArray##scalar_type { \
> > +        size_t len; \
> > +        scalar_type first[]; \
> > +    } QArray##scalar_type; \
> > +    \
> > +    void qarray_create_##scalar_type(scalar_type **auto_var, size_t le=
n);
> > \ +    void qarray_auto_free_##scalar_type(scalar_type **auto_var); \ +
> > +/**
> > + * Defines an array type for the passed @a scalar_type and appropriate
> > + * @a scalar_cleanup_func.
> > + *
> > + * This is typically used from a C unit file.
> > + *
> > + * @param scalar_type - type of the individual array elements
> > + * @param scalar_cleanup_func - appropriate function to free memory
> > dynamically + *                              allocated by individual
> > array elements before + */
> > +#define DEFINE_QARRAY_TYPE(scalar_type, scalar_cleanup_func) \
> > +    void qarray_create_##scalar_type(scalar_type **auto_var, size_t le=
n)
> > \
> > +    { \
> > +        qarray_auto_free_##scalar_type(auto_var); \
> > +        QArray##scalar_type *arr =3D g_malloc0(sizeof(QArray##scalar_t=
ype)
> > + \ +            len * sizeof(scalar_type)); \
> > +        arr->len =3D len; \
> > +        *auto_var =3D &arr->first[0]; \
> > +    } \
> > +    \
> > +    void qarray_auto_free_##scalar_type(scalar_type **auto_var) \
> > +    { \
> > +        scalar_type *first =3D (*auto_var); \
> > +        if (!first) { \
> > +            return; \
> > +        } \
> > +        QArray##scalar_type *arr =3D (QArray##scalar_type *) ( \
> > +            ((char *)first) - offsetof(QArray##scalar_type, first) \
> > +        ); \
> > +        for (size_t i =3D 0; i < arr->len; ++i) { \
> > +            scalar_cleanup_func(&arr->first[i]); \
> > +        } \
> > +        g_free(arr); \
> > +    } \
> > +
> > +/**
> > + * Used to declare a reference variable (unique pointer) for an array.
> > After + * leaving the scope of the reference variable, the associated
> > array is + * automatically freed.
> > + *
> > + * @param scalar_type - type of the individual array elements
> > + */
> > +#define QArrayRef(scalar_type) \
> > +    __attribute((__cleanup__(qarray_auto_free_##scalar_type)))
> > scalar_type* +
> > +/**
> > + * Allocates a new array of passed @a scalar_type with @a len number of
> > array + * elements and assigns the created array to the reference
> > variable + * @a auto_var.
> > + *
> > + * @param scalar_type - type of the individual array elements
> > + * @param auto_var - destination reference variable
> > + * @param len - amount of array elements to be allocated immediately
> > + */
> > +#define QARRAY_CREATE(scalar_type, auto_var, len) \
> > +    qarray_create_##scalar_type((&auto_var), len)
> > +
> > +#endif /* QEMU_QARRAY_H */
>=20
> Regards,
> Daniel



